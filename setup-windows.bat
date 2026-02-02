@echo off
setlocal

set "PROMPTS_DIR=%~dp0prompts"
set "COMMANDS_DIR=%USERPROFILE%\.claude\commands"

if not exist "%COMMANDS_DIR%" mkdir "%COMMANDS_DIR%"

for %%f in ("%PROMPTS_DIR%\*.md") do (
    del "%COMMANDS_DIR%\%%~nxf" 2>nul
    mklink "%COMMANDS_DIR%\%%~nxf" "%%f"
    echo Linked: %%~nxf
)

echo Done. Commands installed to %COMMANDS_DIR%
pause
