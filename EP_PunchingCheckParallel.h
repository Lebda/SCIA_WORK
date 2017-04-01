#pragma once

#ifndef CONCRETECHECKSINTERFACES_H__
	#include "..\..\..\Checks\ConcreteChecks\ConcreteChecksEsa\ConcreteChecksInterfaces.h"
#endif

#include "..\..\..\VON\GeomSpace\EP_GSStrucGeom\ControlPerimeter.h"
#include "PunchingCheckData.h"
#include "BetaCalculator.h"
#include "PunchingWModulHandler.h"
#include "EP_PunchingCheckResult.h"
#include "PunchingEwnHelper.h"
#include "CriticialPerimHandler.h"
#include "BetaKCalc.h"
#include "CalculationChecker.h"
#include "CriticalPerimResultHolder.h"
#include "PunchingCalculationLogger.h"

class CEP_PunchingCheckParallel :
	public CEP_UserCheckParallel
{
public:
	CEP_PunchingCheckParallel(bool isDebug = false);
	virtual ~CEP_PunchingCheckParallel() {}

public:
	virtual CEP_xDCheckResultsMeshElement* CalculateMeshElement(CEP_OneMemberData& rOneMemberData, long lCombiNo, long lMeshElementNo) override;
	virtual bool IsResultExtreme(const CEP_xDCheckResultsMeshElement& rGreatestResult, const CEP_xDCheckResultsMeshElement& rOneResult, long lIndex) const override;
protected:
	bool CreatePolygonforMergedSlabs(SPunchingCheck_CheckData &checkData);

private:
	static punch::COneCriticalPerimResult CalcPerim4Distance(double dSetupCoeff4ControlPerimCalculation, 
		double distance, double rhoL, bool calcW, bool bVedPositie, punch::CCriticialPerimHandler & cphandler, const SPunchingCheck_CheckData& checkData);
	static double GetSetupCoeff4ControlPerimCalculation(const SPunchingCheck_CheckData &checkData);
	bool DoPreparation(long lCombiNo, CCheckersResult& res, SPunchingCheck_CheckData& checkData);
	bool CalculateOnlyOnce4MeshElement(long lCombiNo, SPunchingCheck_CheckData& checkData) const;
	bool CalcReductionU0(const SPunchingCheck_CheckData& checkData, const SPunchingCheck_Results &resultsData, double& dU0Red) const;
	SBetaInputData PrepareBetaInput(const SPunchingCheck_CheckData& checkData, const SPunchingCheck_Results &resultsData);
	void SetResultsFromControlPerimeter(const punch::COneCriticalPerimResult& data, SPunchingCheck_Results &resultsData);
	void SetResultsFromControlPerimeter(const CControlPerimeter& cpMinimal, SPunchingCheck_Results &resultsData);
	void SetResultsFromWModule(const punch::CControlPerimW& wdata, SPunchingCheck_Results &resultsData);
	CString GetPunchingPositionName(GSPerimType::ePerimeterType ePerimType) const;
	CEP_xDCheckResultsMeshElement* CreateNAResult(const SPunchingCheck_CheckData &checkData, const SPunchingCheck_Results &resultsData, punch::CPunchingEwnHelper& ewnHolder);
	CEP_xDCheckResultsMeshElement* CreateResult(const punch::COneCriticalPerimResult& cpActual, const SPunchingCheck_CheckData &checkData, const SPunchingCheck_Results &resultsData, punch::CPunchingEwnHelper& ewnHolder);
	CString GetPlateStr(const SPunchingCheck_CheckData &checkData) const;
	punch::CConcreteShearCapacity CalculateConcreteShearCapacity(const punch::COneCriticalPerimResult& cpActual, const SPunchingCheck_CheckData &checkData, const SPunchingCheck_Results &resultsData);
	punch::CPunchingReinfDesign CalculatePunchReinfDesign(const punch::COneCriticalPerimResult& cpActual, const SPunchingCheck_CheckData &checkData, const SPunchingCheck_Results &resultsData);
	void LogControlPerimeterCalc(const punch::CCriticialPerimOut& data, long lCombiNo, long lMeshElementNo, const SPunchingCheck_CheckData& checkData) const;
	punch::TspIPunchingCalculationLogger CreateLogger(long lCombiNo, long lMeshElementNo, long nodeID) const;
protected:
	TCEP_PunchingCheckResultUPtr m_upCheckResult;
	punch::TspCriticialPerimHandler m_criticalPerimHandler;
	punch::CBetaKCalc m_betaKCalc;
	bool m_isDebug = false;
private:
	static constexpr long s_cpLogPlus = 0;
	static constexpr long s_cpLogMinus = 66;
	punch::TspIPunchingCalculationLogger m_logger;
};
