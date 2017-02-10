@echo off

REM get input arguments
set input=%~dp0
set output=%input%\UT_Results
set resultfile=UT_Xep_Summary.html

REM prepare and clean up TestResult folder
if not exist "%output%" md "%output%"
del "%output%\*.*" /q

nunit-console-x86.exe /noshadow UT_XEP_EsaModelData.dll /work:"%output%" /xml:UT_XEP_EsaModelDataTestResult.xml /out:TestResult_UT_XEP_EsaModelData.txt /err:StdErr_UT_XEP_EsaModelData.txt
nunit-console-x86.exe /noshadow UT_XEP_CheckManager.dll /work:"%output%" /xml:UT_XEP_CheckManagerResult.xml /out:TestResult_UT_XEP_CheckManager.txt /err:StdErr_UT_XEP_CheckManager.txt
nunit-console-x86.exe /noshadow UT_XEP_SdfCalculationProvider.dll /work:"%output%" /xml:UT_XEP_SdfCalculationProviderResult.xml /out:TestResult_UT_XEP_SdfCalculationProvider.txt /err:StdErr_UT_XEP_SdfCalculationProvider.txt
nunit-console-x86.exe /noshadow UT_XEP_ConcreteSectionLibrary.dll /work:"%output%" /xml:UT_XEP_ConcreteSectionLibrary.xml /out:TestResult_UT_XEP_ConcreteSectionLibrary.txt /err:StdErr_UT_XEP_ConcreteSectionLibrary.txt
nunit-console-x86.exe /noshadow UT_XEP_SdfViewer.dll /work:"%output%" /xml:UT_XEP_SdfViewerResult.xml /out:TestResult_UT_XEP_SdfViewer.txt /err:StdErr_UT_XEP_SdfViewer.txt
nunit-console-x86.exe /noshadow UT_XEP_SectionCheck.dll /work:"%output%" /xml:UT_XEP_SectionCheck.xml /out:TestResult_UT_XEP_SectionCheck.txt /err:StdErr_UT_XEP_SectionCheck.txt
nunit-console-x86.exe /noshadow UT_XEP_SectionCheckEsaCommunication.dll /work:"%output%" /xml:UT_XEP_SectionCheckEsaCommunication.xml /out:TestResult_UT_XEP_SectionCheckEsaCommunication.txt /err:StdErr_UT_XEP_SectionCheckEsaCommunication.txt
nunit-console-x86.exe /noshadow UT_XEP_SectionCheckInput.dll /work:"%output%" /xml:UT_XEP_SectionCheckInput.xml /out:TestResult_UT_XEP_SectionCheckInput.txt /err:StdErr_UT_XEP_SectionCheckInput.txt
nunit-console-x86.exe /noshadow UT_XEP_Common.dll /work:"%output%" /xml:UT_XEP_Common.xml /out:TestResult_UT_XEP_Common.txt /err:StdErr_UT_XEP_Common.txt
nunit-console-x86.exe /noshadow UT_XEP_AddDataCalculator.dll /work:"%output%" /xml:UT_XEP_AddDataCalculator.xml /out:TestResult_UT_XEP_AddDataCalculator.txt /err:StdErr_UT_XEP_AddDataCalculator.txt

"nunit-summary.exe" "%output%\*.xml" -out="%output%\%resultfile%"
if not "%1" == "HIDE" (
	%output%\%resultfile%"
)
