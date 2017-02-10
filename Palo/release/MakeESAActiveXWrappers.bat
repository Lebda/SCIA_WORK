@echo off
if "%StartPath%"=="" set StartPath=%CD%\
@echo StartPath=%StartPath%

if "%BUILDVS15%"=="" (
	@echo Using default builder VS2015
	set BUILDVS15=YES
)

rem Register system Ax controls
@echo Register system Ax controls
call %StartPath%ep_regsvr32 /SYSONLY @A_P.regSYS.txt

set CSHARPFOLDER=%StartPath%C#Support\
if not exist %CSHARPFOLDER% (
	@echo Create directory %CSHARPFOLDER%
	md %CSHARPFOLDER%
)

rem set ESAEXTRALIBPATH=%CSHARPFOLDER%

rem Prepare compiler paths

set MyPathBack=%CD%
cd ..\..\_ConfigBuilder
call _BuildConfigEnvVars.bat
cd %MyPathBack%
@echo FrameworkFolder=%FrameworkDir%\%FrameworkVersion%

call MakeESAActiveXWrapperCS.bat %StartPath%EP_3D_09.dll EP_3D %CSHARPFOLDER%
rem call MakeESAActiveXWrapperCS.bat %StartPath%X64DocumentPreview_09.dll X64DocumentPreview %CSHARPFOLDER%
