@echo off

cd %APPVEYOR_BUILD_FOLDER%

:: =========================================================
:: Set some defaults. Infer some variables.
::
:: These are set globally
if "%LUA_VER%" NEQ "" (
	set LUA=lua
	set LUA_SHORTV=%LUA_VER:~0,3%
)

:: Now we declare a scope
Setlocal EnableDelayedExpansion EnableExtensions

if not defined SEVENZIP set SEVENZIP=7z
if not defined LUA_URL set LUA_URL=http://www.lua.org/ftp
::
:: =========================================================

:: first create some necessary directories:
mkdir downloads 2>NUL

:: Download Lua
if not exist downloads\lua-%LUA_VER% (
	curl --silent --fail --max-time 120 --connect-timeout 30 %LUA_URL%/lua-%LUA_VER%.tar.gz | %SEVENZIP% x -si -so -tgzip | %SEVENZIP% x -si -ttar -aoa -odownloads
) else (
	echo Lua %LUA_VER% already downloaded at downloads\lua-%LUA_VER%
)

endlocal

goto :eof


:: helper functions:

:: for bailing out when an error occurred
:die %1
echo %1
exit /B 1
goto :eof

