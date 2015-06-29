@echo off

cd %APPVEYOR_BUILD_FOLDER%

:: Declare a local scope
Setlocal EnableDelayedExpansion EnableExtensions

if defined NOCOMPAT (
	set COMPATFLAG=--nocompat
) else (
	set COMPATFLAG=
)

set BUILD_DIR=%APPVEYOR_BUILD_FOLDER%\build\lua-%LUA_VER%
set INSTALL_DIR=%APPVEYOR_BUILD_FOLDER%\install\lua-%LUA_VER%

mkdir %BUILD_DIR% 2>NUL
mkdir %INSTALL_DIR% 2>NUL

xcopy /E downloads\lua-%LUA_VER% %BUILD_DIR%

mkdir %BUILD_DIR%\etc 2> NUL
copy etc\winmake.bat %BUILD_DIR%\etc\winmake.bat
cd %BUILD_DIR%

call etc\winmake %COMPATFLAG% || call :die "Failed to build"
call etc\winmake install %INSTALL_DIR% || call :die "Failed to install"

echo.
echo ======================================================
echo Compilation of Lua %LUA_VER% done.
if defined NOCOMPAT echo Lua was built with compatibility flags disabled.

echo Platform         - %platform%

endlocal & set PATH=%INSTALL_DIR%\bin;%PATH%&^
set INSTALL_DIR=%INSTALL_DIR%

goto :eof


:: helper functions:

:: for bailing out when an error occurred
:die %1
echo %1
exit /B 1
goto :eof


