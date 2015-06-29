@echo off

Setlocal EnableDelayedExpansion EnableExtensions

if not defined SEVENZIP set SEVENZIP=7z
cd %INSTALL_DIR%

set _artifact_file=luawinmake-%APPVEYOR_REPO_COMMIT%-%platform%-%Configuration%.7z

%SEVENZIP% a %_artifact_file% %INSTALL_DIR%\*
appveyor PushArtifact %_artifact_file%

endlocal
