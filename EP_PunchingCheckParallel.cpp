#include "stdafx.h"
#include "EP_PunchingCheckParallel.h"
#include "..\..\..\Results64\Results64API\PunchingResultTypes.h"

#include "..\..\..\VON\GeomSpace\EP_GSStrucGeom\ControlPerimeterTool.h"
#include "..\..\..\VON\GeomSpace\EP_GSStrucGeom\ControlPerimeterResults.h"

#include "..\..\..\CHA\GeomData\EP_DSG_Elements\EP_SlabMergingTool.h"
#include "..\..\..\CHA\GeomData\EP_DSG_Elements\EP_MergeOnlyConnectedSlabs.h"

#include "resource.h"
#include "GeomUtils.h"
#include "CalculationChecker.h"
#include "ShapeSeeker.h"
#include "BetaCalculator.h"
#include "EP_Css_FormCodes.h"
#include "U0Calculator.h"
#include "SlabService.h"
#include "PunchingEwnHelper.h"
#include "Ioc\IocContainer.h"
#include "DiContainerProvider.h"
#include "ConcreteShearCapacityCalc.h"
#include "ControlPerimLogger.h"
#include "PunchingReinfDesignInput.h"
#include "PunchingReinfDesigner.h"
#include "BaseCalcResult.h"
#include "Reduction.h"
#include "ShearReinfStringFormater.h"


using namespace punch;
using namespace ioc;
//---------------------------------------------------------------------------
CEP_PunchingCheckParallel::CEP_PunchingCheckParallel(bool isDebug)
	: m_isDebug(isDebug)
{
	m_upCheckResult = std::make_unique<CEP_PunchingCheckResult>(CEP_Punching_ResultType_0D::eDoubleMagnitudesCount,
		CEP_Punching_ResultType_0D::eMagnitudesCount - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount);
	CHECKED_VARIABLE_REQ_PTR(m_upCheckResult);
	m_criticalPerimHandler = diHelpers::Resolve<CCriticialPerimHandler>(CDiContainerProvider::Get());
	CHECKED_VARIABLE_REQ_PTR(m_criticalPerimHandler);
}
//---------------------------------------------------------------------------
CEP_xDCheckResultsMeshElement* CEP_PunchingCheckParallel::CalculateMeshElement(CEP_OneMemberData& rOneMemberData, long lCombiNo, long lMeshElementNo)
{
	DLL_RC_LCID_PROLOGUE(LCID_FROM_DLL_RC(););

	TSPunchingCheck_CheckDataSharedPtr checkData = std::static_pointer_cast<SPunchingCheck_CheckData>(rOneMemberData.GetInputs());
	if (checkData == nullptr) {
		ASSERT_EXCEPT();
		return nullptr;
	}
	SPunchingCheck_Results resultsData;
	CPunchingEwnHelper ewnHolder;
	CCheckersResult res(ewnHolder);
	m_logger = CreateLogger(lCombiNo, lMeshElementNo, checkData->m_nodeID);
	CHECKED_VARIABLE_REQ_PTR(m_logger);

	checkData->m_nodesPropertiesResults.FillEwn(ewnHolder);

	if (checkData->m_nodesPropertiesResults.IsNAresult())
	{
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	if (lCombiNo != 0 && !checkData->m_bIsready4Calculation)
	{
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	if (!DoPreparation(lCombiNo, res, *checkData) ||
		checkData->m_mapCssData.empty() ||
		!CalculateOnlyOnce4MeshElement(lCombiNo, *checkData))
	{
		checkData->m_bIsready4Calculation = false;
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	if (checkData->m_criticalPerimResutlHolder.IsEmpty())
	{
		ASSERT_EXCEPT();
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	//TODO BAR | reduction of perimeter
	//------------------------------------------------------
	resultsData.m_punchForces.m_Ved  = checkData->m_forces[lCombiNo].m_Ved;
	resultsData.m_punchForces.m_Medy = fabs(checkData->m_forces[lCombiNo].m_Medy);
	resultsData.m_punchForces.m_Medz = fabs(checkData->m_forces[lCombiNo].m_Medz);
	eCriticalPerimOffsetType offsetType = eCriticalPerimOffsetType::eStandardD4VedPositive;
	if (DoubleLessThan(resultsData.m_punchForces.m_Ved, 0.0, 1e-6))
	{
		offsetType = eCriticalPerimOffsetType::eStandardD4VedNegative;
	}
	if (!checkData->m_criticalPerimResutlHolder.IsCalculated(offsetType))
	{
		ASSERT_EXCEPT();
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	const auto& cpResult4Job = checkData->m_criticalPerimResutlHolder.Get(offsetType);
	if (cpResult4Job.GetOutputdata().GetErrors().AreErrors())
	{
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	SetResultsFromControlPerimeter(cpResult4Job, resultsData);

	resultsData.m_BetaFactor = CBetaCalculator::Calculate_GetBeta(PrepareBetaInput(*checkData, resultsData));
	resultsData.m_conShearCapacity = CalculateConcreteShearCapacity(cpResult4Job, *checkData, resultsData);
	if (resultsData.m_conShearCapacity.AreErrors())
	{
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	//TODO BAR | reduction of perimeter
	if (!CalcReductionU0(*checkData, resultsData))
	{
		ASSERT_EXCEPT();
		return CreateNAResult(*checkData, resultsData, ewnHolder);
	}
	resultsData.m_punchReinfDesign = CalculatePunchReinfDesign(cpResult4Job, *checkData, resultsData);
	return CreateResult(cpResult4Job, *checkData, resultsData, ewnHolder);
}
//---------------------------------------------------------------------------
bool CEP_PunchingCheckParallel::DoPreparation(long lCombiNo, CCheckersResult& res, SPunchingCheck_CheckData& checkData)
{
	if (lCombiNo == 0)
	{
		CCalculationChecker calcChecker;
		calcChecker.RunPreCalcChecks(checkData, res);
		if (!res.Evaluate())
		{
			return false;
		}			
				
		// Check openings from original slab shapes		
		for (const auto& slabId : checkData.m_SlabData.m_listConnectedSlabs)
		{			
			if (!calcChecker.CheckOpeningAroundColumn(checkData, checkData.m_SlabData.m_SlabShapes[slabId]))
			{
				return false;
			}
		}		

		// Check openings from merged slab
		if (!calcChecker.CheckOpeningAroundColumn(checkData, checkData.m_SlabData.m_FinalPlanes))
		{ 
			return false;
		}
		
	}
	return true;
}
//---------------------------------------------------------------------------
bool CEP_PunchingCheckParallel::CalculateOnlyOnce4MeshElement(long lCombiNo, SPunchingCheck_CheckData& checkData) const
{
	if (lCombiNo == 0)
	{ 
		CU0Calculator::Prepare_FillU0Value(checkData);

		COneCriticalPerimResult resultPlus = CalcPerim4Distance(
			GetSetupCoeff4ControlPerimCalculation(checkData), checkData.m_sdfDesign.GetEffectHeightPlus(), checkData.m_sdfDesign.GetRholPlus(), true, *m_criticalPerimHandler, checkData);
		checkData.m_criticalPerimResutlHolder.Add(eCriticalPerimOffsetType::eStandardD4VedPositive, resultPlus);
		if (resultPlus.GetOutputdata().AreErrors())
		{
			checkData.m_criticalPerimResutlHolder.Add(eCriticalPerimOffsetType::eStandardD4VedNegative, resultPlus);
			return false;
		}
		LogControlPerimeterCalc(resultPlus.GetOutputdata(), lCombiNo, s_cpLogPlus, checkData);
		if (checkData.m_criticalPerimResutlHolder.IsCalculated4Offset(resultPlus.GetInputdata().CalcCriticalOffset()))
		{
			auto resultMinus = resultPlus;
			CData4OneCriticalPerim data4Perim = resultMinus.GetInputdata();
			data4Perim.SetRhoL(checkData.m_sdfDesign.GetRholMinus());
			resultMinus.SetInputdata(data4Perim);
			checkData.m_criticalPerimResutlHolder.Add(eCriticalPerimOffsetType::eStandardD4VedNegative, resultMinus);
			return true;
		}
		COneCriticalPerimResult resultMinus = CalcPerim4Distance(
			GetSetupCoeff4ControlPerimCalculation(checkData),
			checkData.m_sdfDesign.GetEffectHeightMinus(), checkData.m_sdfDesign.GetRholMinus(), true, *m_criticalPerimHandler, checkData);
		checkData.m_criticalPerimResutlHolder.Add(eCriticalPerimOffsetType::eStandardD4VedNegative, resultMinus);
		if (resultMinus.GetOutputdata().AreErrors())
		{
			return false;
		}
		LogControlPerimeterCalc(resultMinus.GetOutputdata(), lCombiNo, s_cpLogMinus, checkData);
	}
	return true;
}
//---------------------------------------------------------------------------
COneCriticalPerimResult CEP_PunchingCheckParallel::CalcPerim4Distance(
	double dSetupCoeff4ControlPerimCalculation, double distance, double rhoL, bool calcW,
	CCriticialPerimHandler & cphandler, 
	const SPunchingCheck_CheckData& checkData)
{
	CData4OneCriticalPerim data4Perim;
	data4Perim.SetCalculationCoeff(dSetupCoeff4ControlPerimCalculation);
	data4Perim.SetEffectHeight(distance);
	data4Perim.SetRhoL(rhoL);
	CCriticialPerimInput criticalPerimInput;
	criticalPerimInput.SetCritPerimOffset(data4Perim.CalcCriticalOffset());
	criticalPerimInput.SetIsCalculateWData(calcW);
	COneCriticalPerimResult result;
	result.SetInputdata(data4Perim);
	result.SetOutputdata(cphandler.Run(checkData, criticalPerimInput));
	return result;
}
//---------------------------------------------------------------------------
double CEP_PunchingCheckParallel::GetSetupCoeff4ControlPerimCalculation(const SPunchingCheck_CheckData &checkData)
{
	double setupCoef = checkData.m_setup.GetControlPerimData().GetDistanceBasicControlPerimCeiling();
	if (checkData.m_slabApproximation.GetContactStress().GetIsFoundation())
	{
		setupCoef = checkData.m_setup.GetControlPerimData().GetDistanceBasicControlPerimFoundation();
	}
	return setupCoef;
}

//---------------------------------------------------------------------------
bool CEP_PunchingCheckParallel::CalcReductionU0(const SPunchingCheck_CheckData& checkData, 
	const SPunchingCheck_Results &resultsData) const
{
	//TODO BAR | reduction of perimeter
	SReductionInputData redData;
	redData.m_ePerimType = resultsData.m_ePerimType;
	redData.m_alpaDeg = 0.0; // TODO calc alpha
	redData.m_b = 0.0; // TODO
	redData.m_h = 0.0; // TODO
	redData.m_d = 0.0; // TODO
	redData.m_sFormCode = eFC_ob_rect; // TODO
	CReduction red;
	double dU0red = -1;
	return red.CalcReduction(redData, dU0red);
	//Set results
}
//---------------------------------------------------------------------------
void CEP_PunchingCheckParallel::LogControlPerimeterCalc(const CCriticialPerimOut& data, long lCombiNo, long lMeshElementNo, const SPunchingCheck_CheckData& checkData) const
{
	TspCIControlPerimLogger logger;
	if (m_isDebug)
	{
		logger = diHelpers::Resolve<CControlPerimLogger>(CDiContainerProvider::Get());
	}
	else
	{
		logger = diHelpers::Resolve<CControlPerimLoggerMock>(CDiContainerProvider::Get());
	}
	CHECKED_VARIABLE_REQ_PTR(logger);
	CControlPerimLoggerInput input;
	input.SetCombiNo(lCombiNo);
	input.SetMeshElementNo(lMeshElementNo);
	input.SetNodeId(checkData.m_nodeID);
	input.SetOutCp(data);
	logger->Log(input);
}
//---------------------------------------------------------------------------
TspIPunchingCalculationLogger CEP_PunchingCheckParallel::CreateLogger(long lCombiNo, long lMeshElementNo, long nodeID) const
{
	TspIPunchingCalculationLogger logger;
	if (m_isDebug)
	{
		logger = diHelpers::Resolve<CPunchingCalculationLogger>(CDiContainerProvider::Get());
	}
	else
	{
		logger = diHelpers::Resolve<CPunchingCalculationLoggerMock>(CDiContainerProvider::Get());
	}
	CLoggerStartData startData;
	startData.SetCombiNo(lCombiNo);
	startData.SetMeshElementNo(lMeshElementNo);
	startData.SetNodeId(nodeID);
	logger->SetStartData(startData);
	return logger;
}
//---------------------------------------------------------------------------
SBetaInputData CEP_PunchingCheckParallel::PrepareBetaInput(const SPunchingCheck_CheckData& checkData, const SPunchingCheck_Results &resultsData)
{
	SBetaInputData betaData;
	betaData.m_ePerimType = resultsData.m_ePerimType;
	betaData.m_u1 = resultsData.m_perimData.GetLength();
	betaData.m_betaValues = checkData.m_setup.GetBetaData();
	betaData.m_Ved1 = resultsData.m_punchForces.m_Ved;
	CBetaKInput kInput;
	double dSizeX = CShapeSeeker::GetCssSizeX(checkData.m_mapCssData);
	double dSizeY = CShapeSeeker::GetCssSizeY(checkData.m_mapCssData);
	kInput.SetC1(dSizeY);
	kInput.SetC2(dSizeX);
	betaData.m_kx = m_betaKCalc.Run(kInput);
	kInput.SetC1(dSizeX);
	kInput.SetC2(dSizeY);
	betaData.m_ky = m_betaKCalc.Run(kInput);

	betaData.m_Medx = resultsData.m_punchForces.m_Medy;
	betaData.m_Medy = resultsData.m_punchForces.m_Medz;
	betaData.m_ex1 = resultsData.m_perimData.GetEx();
	betaData.m_ey1 = resultsData.m_perimData.GetEy();
	betaData.m_wx1 = resultsData.m_perimData.GetWx();
	betaData.m_wy1 = resultsData.m_perimData.GetWy();

	return betaData;
}
//---------------------------------------------------------------------------
void CEP_PunchingCheckParallel::SetResultsFromControlPerimeter(const COneCriticalPerimResult& data, SPunchingCheck_Results &resultsData)
{
	CHECKED_VARIABLE_REQ_PTR(data.GetOutputdata().GetCriticalPerim());
	SetResultsFromControlPerimeter(*data.GetOutputdata().GetCriticalPerim(), resultsData);
	SetResultsFromWModule(data.GetOutputdata().GetWModulHandlerData().GetControlPerimW(), resultsData);
}
//---------------------------------------------------------------------------
void CEP_PunchingCheckParallel::SetResultsFromControlPerimeter(const CControlPerimeter& cpMinimal, SPunchingCheck_Results &resultsData)
{
	resultsData.m_ePerimType = cpMinimal.GetType();
	resultsData.m_dPerimetrArea = cpMinimal.GetPerimeterArea();
}
//---------------------------------------------------------------------------
void CEP_PunchingCheckParallel::SetResultsFromWModule(const punch::CControlPerimW& wdata, SPunchingCheck_Results &resultsData)
{
	resultsData.m_perimData = wdata;
}
//---------------------------------------------------------------------------
bool CEP_PunchingCheckParallel::CreatePolygonforMergedSlabs(SPunchingCheck_CheckData &checkData)
{	
	CEP_MergeOnlyConnectedSlabs pModificator;
	CEP_SlabMergingTool mergeTool;

	return mergeTool.ConnectSlabs(checkData.m_SlabData.m_SlabId, checkData.m_SlabData.m_SlabNormal, checkData.m_SlabData.m_SlabShapes, &pModificator, checkData.m_SlabData.m_listConnectedSlabs, checkData.m_SlabData.m_FinalPlanes);
}
//---------------------------------------------------------------------------
CConcreteShearCapacity CEP_PunchingCheckParallel::CalculateConcreteShearCapacity(
	const COneCriticalPerimResult& cpActual, 
	const SPunchingCheck_CheckData &checkData, 
	const SPunchingCheck_Results &resultsData)
{
	CConcreteShearCapacityInput input;
	input.SetBeta(resultsData.m_BetaFactor);
	input.SetDy(cpActual.GetInputdata().GetEffectHeight());
	input.SetDz(cpActual.GetInputdata().GetEffectHeight());
	input.SetRhoLy(cpActual.GetInputdata().GetRhoL());
	input.SetRhoLz(cpActual.GetInputdata().GetRhoL());
	input.SetU0(checkData.m_dU0);
	input.SetU1(resultsData.m_perimData.GetLength());
	input.SetVed(resultsData.m_punchForces.m_Ved);
	CMaterialConcrete material;
	material.SetFck(checkData.m_slabApproximation.GetFck());
	material.SetGamaC(checkData.m_setup.GetSetupNA().GetGammaC());
	input.SetMatCon(material);
	CFoundationData foundation;
	foundation.SetCoeff(checkData.m_setup.GetControlPerimData().GetDistanceBasicControlPerimFoundation());
	foundation.SetIsFoundation(checkData.m_slabApproximation.GetContactStress().GetIsFoundation());
	input.SetFoundationData(foundation);
	TspConcreteShearCapacityCalc test = diHelpers::Resolve<CConcreteShearCapacityCalc>(CDiContainerProvider::Get());
	CHECKED_VARIABLE_REQ_PTR(test);
	return test->Run(input);
}
//---------------------------------------------------------------------------
CPunchingReinfDesign CEP_PunchingCheckParallel::CalculatePunchReinfDesign(
	const punch::COneCriticalPerimResult& cpActual, 
	const SPunchingCheck_CheckData &checkData, 
	const SPunchingCheck_Results &resultsData)
{
	CHECKED_VARIABLE_REQ_PTR(m_logger);
	CPunchingReinfDesignInput input;
	input.SetBeta(resultsData.m_BetaFactor);
	input.SetVed(resultsData.m_punchForces.m_Ved);
	input.SetNiRdc(resultsData.m_conShearCapacity.GetVrdc().GetValue());
	input.SetNiEdU1(resultsData.m_conShearCapacity.GetNiEdU1().GetValue());
	input.SetDeff(cpActual.GetInputdata().GetEffectHeight());
	input.SetAu1(cpActual.GetInputdata().CalcCriticalOffset());
	input.SetU1(resultsData.m_perimData.GetLength());
	input.SetAlpha(M_PI_2);
	input.SetDs(checkData.m_memberData.shearDiameter);
	input.SetMinShearReinfFactor(checkData.m_setup.GetOtherData().m_minShearReinfFactor);
	input.SetKmaxSetup(checkData.m_setup.GetOtherData().m_k_max);
	{
		CDetailingRulesSetup detRules;
		detRules.SetNperMin(checkData.m_setup.GetOtherData().m_n_min);
		detRules.SetNs0(checkData.m_setup.GetOtherData().m_sz_min);
		detRules.SetNsr(checkData.m_setup.GetOtherData().m_sr_max);
		detRules.SetNst(checkData.m_setup.GetOtherData().m_st_max);
		input.SetDetailingRulesSetup(detRules);
	}
	CDetailingDistances resultDistance;
	{
		CDetailingDistancesInput inputDistance;
		inputDistance.SetDeff(cpActual.GetInputdata().GetEffectHeight());
		inputDistance.SetIsUseSetupValues(!checkData.m_setup.GetSetupData().useDetailing);
		inputDistance.SetS0Setup(checkData.m_memberData.s0);
		inputDistance.SetSrSetup(checkData.m_memberData.sr);
		inputDistance.SetDetRules(input.GetDetailingRulesSetup());
		CDetailingDistancesCalc distancePrep;
		resultDistance = distancePrep.Run(inputDistance);
		CDetailingDistances distances;
		distances.SetS0(resultDistance.GetS0());
		distances.SetSr(resultDistance.GetSr());
		distances.SetStMax(resultDistance.GetStMax());
		input.SetDetDistances(distances);
	}
	input.SetMaterialReinf(checkData.m_memberData.reinfMaterial);
	CMaterial concrete;
	concrete.SetFk(checkData.m_slabApproximation.GetFck());
	concrete.SetGamma(checkData.m_setup.GetSetupNA().GetGammaC());
	input.SetMaterialConcrete(concrete);
	TspPunchingReinfDesignerCalc calculator = diHelpers::Resolve<CPunchingReinfDesignerCalc>(CDiContainerProvider::Get());
	CHECKED_VARIABLE_REQ_PTR(calculator);
	TCriticalPerimCallBack cpCalcCallback = [&](double offset, double dDEff, CReinfDesignResult& resultDesign)
	{ // CallBack for U calculation
		double retVal = s_dCheckValueNotCalc;
		auto resultCp = CalcPerim4Distance(offset, dDEff, cpActual.GetInputdata().GetRhoL(), false, *m_criticalPerimHandler, checkData);
		if (resultDesign.MergeErrors(resultCp.GetOutputdata().GetErrors()))
		{
			resultDesign.GetReinfDesignErrors4Modif().Add(eReinfDesignError::eInvalidCpCallBack);
			return retVal;
		}
		CHECKED_VARIABLE_REQ_PTR(resultCp.GetOutputdata().GetCriticalPerim());
		retVal = resultCp.GetOutputdata().GetCriticalPerim()->GetLength();
		return retVal;
	};
	CPunchingReinfDesign resultDesign;
	if (resultDistance.AreErrors())
	{
		resultDesign.MergeErrors(resultDistance);
	}
	else
	{
		resultDesign = calculator->Run(input, cpCalcCallback);
		CShearReinfStringFormater formater;
		resultDesign.SetShearReinfFormatString(formater.Run(input, resultDesign));
	}
	m_logger->Log(input, resultDesign);
	return resultDesign;
}
//---------------------------------------------------------------------------
CEP_xDCheckResultsMeshElement* CEP_PunchingCheckParallel::CreateResult(
	const COneCriticalPerimResult& cpActual, 
	const SPunchingCheck_CheckData &checkData, 
	const SPunchingCheck_Results &resultsData,
	CPunchingEwnHelper& ewnHolder)
{
	CHECKED_VARIABLE_REQ_PTR(m_logger);
	m_logger->StopLogger();
	resultsData.m_conShearCapacity.SetEwn(ewnHolder, checkData.m_setup.GetCheckLimitValue());
	resultsData.m_punchReinfDesign.SetEwn(ewnHolder, checkData.m_setup.GetCheckLimitValue());
	checkData.m_criticalPerimResutlHolder.SetEwn(ewnHolder);
	m_upCheckResult->Erase();
	// reinf design
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUout, resultsData.m_punchReinfDesign.GetUout().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAout, resultsData.m_punchReinfDesign.GetAout().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUsLast, resultsData.m_punchReinfDesign.GetDistUsLast().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eSt, resultsData.m_punchReinfDesign.GetSt().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswMin, resultsData.m_punchReinfDesign.GetAswMin().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAsw, resultsData.m_punchReinfDesign.GetAswChecked().GetAsw());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswReqU1, resultsData.m_punchReinfDesign.GetAswReqU1().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswU1, resultsData.m_punchReinfDesign.GetAswTotalU1().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCAswU1, resultsData.m_punchReinfDesign.GetUc().GetDetailingUC().GetMaxUC());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCkmax, resultsData.m_punchReinfDesign.GetUc().GetShearReinfUC().GetUC());
	//
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVed, resultsData.m_punchForces.m_Ved);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eBeta, resultsData.m_BetaFactor);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eMedy, resultsData.m_punchForces.m_Medy);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eMedz, resultsData.m_punchForces.m_Medz);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eU0, checkData.m_dU0);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eU1, resultsData.m_perimData.GetLength());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eH, checkData.m_slabApproximation.GetThickness());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eDeff, cpActual.GetInputdata().GetEffectHeight());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eRhol, cpActual.GetInputdata().GetRhoL());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVrdmax, resultsData.m_conShearCapacity.GetVRdmax().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVrdc, resultsData.m_conShearCapacity.GetVrdc().GetValue());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCVrdmax, resultsData.m_conShearCapacity.CalcUCVRdmax());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCVrdc, resultsData.m_conShearCapacity.CalcUCVrdc());
	
	double unityCheck = max(max(resultsData.m_conShearCapacity.CalcUCVRdmax(), resultsData.m_punchReinfDesign.GetUc().GetDetailingUC().GetMaxUC()), resultsData.m_punchReinfDesign.GetUc().GetShearReinfUC().GetUC());
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUnityCheck, unityCheck);
	//
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePlate - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, GetPlateStr(checkData));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePunchingShape - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, CShapeSeeker::GetCssName(checkData.m_mapCssData));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePerimPosition - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, GetPunchingPositionName(resultsData.m_ePerimType));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePunchShearReinf - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, resultsData.m_punchReinfDesign.GetShearReinfFormatString());

	m_upCheckResult->SetEWN(ewnHolder.GetEwn());
	auto pResCont = std::make_unique<CPunchingResultContainer>();
	pResCont->SetCurveU1(cpActual.GetOutputdata().GetCriticalPerim()->GetAsPolyLine());
	pResCont->SetCurveMergedSlab(checkData.m_SlabData.m_pLoopSlabModified->GetShape());
	m_upCheckResult->SetCurveResultNo(std::move(pResCont));
	return m_upCheckResult.get();
}
//---------------------------------------------------------------------------
CString CEP_PunchingCheckParallel::GetPlateStr(const SPunchingCheck_CheckData &checkData) const
{
	DLL_RC_LCID_PROLOGUE(LCID_FROM_DLL_RC());
	if (checkData.m_slabApproximation.GetContactStress().GetIsFoundation()) {
		return RSC_str(IDS_FOUNDATION);
	}
	else {
		return RSC_str(IDS_CEILING);
	}
}
//---------------------------------------------------------------------------
CEP_xDCheckResultsMeshElement* CEP_PunchingCheckParallel::CreateNAResult(
	const SPunchingCheck_CheckData &checkData, 
	const SPunchingCheck_Results &resultsData,
	CPunchingEwnHelper& ewnHolder)
{
	DLL_RC_LCID_PROLOGUE(LCID_FROM_DLL_RC());
	CHECKED_VARIABLE_REQ_PTR(m_logger);
	m_logger->StopLogger();
	checkData.m_criticalPerimResutlHolder.SetEwn(ewnHolder);
	resultsData.m_conShearCapacity.SetEwn(ewnHolder, checkData.m_setup.GetCheckLimitValue());
	resultsData.m_punchReinfDesign.SetEwn(ewnHolder, checkData.m_setup.GetCheckLimitValue());
	m_upCheckResult->Erase();
	// reinf design
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUout, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAout, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUsLast, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eSt, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswMin, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAsw, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswReqU1, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eAswU1, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCAswU1, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCkmax, ERRORVALUE);

	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVed,    ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eBeta,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eMedy,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eMedz,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eU0,     ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eU1,     ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eH,      ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eDeff,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eRhol,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVrdmax, ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eVrdc,   ERRORVALUE);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCVrdmax, 3.);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUCVrdc,   3.);
	m_upCheckResult->SetResultNo(CEP_Punching_ResultType_0D::eUnityCheck, 3.);

	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePlate - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, RSC_str(IDS_NA_RESULT));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePunchingShape - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, RSC_str(IDS_NA_RESULT));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePerimPosition - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, RSC_str(IDS_NA_RESULT));
	m_upCheckResult->SetStringResultNo(CEP_Punching_ResultType_0D::ePunchShearReinf - CEP_Punching_ResultType_0D::eDoubleMagnitudesCount, RSC_str(IDS_NA_RESULT));
	m_upCheckResult->SetEWN(ewnHolder.GetEwn());
	return m_upCheckResult.get();
}
//---------------------------------------------------------------------------
CString CEP_PunchingCheckParallel::GetPunchingPositionName(GSPerimType::ePerimeterType ePerimType) const
{
	DLL_RC_LCID_PROLOGUE(LCID_FROM_DLL_RC());
	switch (ePerimType)
	{
	case ePerimUndefined: return RSC_str(IDS_PUNCHING_POSITION_UNDEFINED);
	case ePerimInner: return RSC_str(IDS_PUNCHING_POSITION_INNER);
	case ePerimEdge: return RSC_str(IDS_PUNCHING_POSITION_EDGE);
	case ePerimCorner: return RSC_str(IDS_PUNCHING_POSITION_CORNER);
	case ePerimOppositeEdges: return RSC_str(IDS_PUNCHING_POSITION_EDGE_OPPOSITE);
	case ePerimOppositeEdgesSeg: return RSC_str(IDS_PUNCHING_POSITION_SEGMENT);
	default:
		ASSERT_EXCEPT();
		return CString();
	}
	return CString();
}
//---------------------------------------------------------------------------