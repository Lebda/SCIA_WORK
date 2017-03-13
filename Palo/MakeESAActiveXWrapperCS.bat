set BUILDVS15=YES
@echo off
set ActiveXFileName=%1
@echo.
@echo -----------------------------------------------------------------------
@echo Make ESA ActiveX
@echo ActiveXFileName: %ActiveXFileName%
if not exist %ActiveXFileName% (
	@echo Error - invalid parameter !
	@echo.
	goto usage
)

set LibName=%2
if "%LibName%" == "" (
	@echo Error - invalid parameter !
	@echo.
	goto usage
)
@echo LibName        : %LibName%

set OutputFolder=%3
@echo OutputFolder   : %OutputFolder%

set OutputFileName=ESAAx%LibName%
@echo OutputFileName : %OutputFileName%

set OutputNameDll=%OutputFolder%%OutputFileName%.dll
@echo OutputNameDll  : %OutputNameDll%
set OutSwitch= /Out:%OutputNameDll%

rem Create C# wrapper class and dll
@echo.
@echo AxImp.exe %ActiveXFileName% /source %OutSwitch%
call AxImp.exe %ActiveXFileName% /source %OutSwitch%
if not %errorlevel% == 0 (
	@echo Error - AxImp.exe 
	exit /b -1
)

rem Replace ActiveX creator
@echo.
@echo ESAAxImp.exe %ActiveXFileName% %OutSwitch%
call ESAAxImp.exe %ActiveXFileName% %OutSwitch%
if not %errorlevel% == 0 (
	@echo Error - ESAAxImp.exe 
	exit /b -1
)
@echo.

rem Compile class for usage in Toolbox items

set LibFileName=%OutputFolder%%LibName%Lib.dll
@echo LibFileName    :%LibFileName%

set ESAAtlClass=%OutputFolder%ESAAtl80Class.cs
@echo ESAAtlClass    :%ESAAtlClass%

set ESAActiveXClass=%OutputFolder%%OutputFileName%.cs
@echo ESAActiveXClass:%ESAActiveXClass%

@echo.
@echo csc.exe /t:library /r:%LibFileName% %OutSwitch% %ESAAtlClass% %ESAActiveXClass%
csc.exe /t:library /r:%LibFileName% %OutSwitch% %ESAAtlClass% %ESAActiveXClass%
if not %errorlevel% == 0 (
	@echo Error - csc.exe
	exit /b -1
)

goto end

:usage
	@echo.
	@echo Usage:
	@echo ======
	@echo MakeESAActiveXWrapperCS.bat ESAActiveX.tlb 
	@echo MakeESAActiveXWrapperCS.bat ESAActiveX.tlb WrapperFileName [WraperFilePath]
	exit /b -1

:end
exit /b 0
