@echo off
setlocal EnableDelayedExpansion

:: ============= CONFIG =============
set "HOOKS_DIR=.githooks"
set "EXCLUDE=setup-hooks.bat"
set "TODAY="
for /f %%A in ('powershell -Command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%A

:: Colors
set "RED="
set "GREEN="
set "YELLOW="
set "CYAN="
set "NC="
if "%ANSICON%"=="" (
    set "RED="
    set "GREEN="
    set "YELLOW="
    set "CYAN="
    set "NC="
) else (
    set "RED=\e[31m"
    set "GREEN=\e[32m"
    set "YELLOW=\e[33m"
    set "CYAN=\e[36m"
    set "NC=\e[0m"
)

:: Find Git root (assuming script is run from repo root or .githooks)
set "GITROOT="
if exist ".git" (
    set "GITROOT=%cd%"
) else if exist "..\.git" (
    pushd ..
    set "GITROOT=%cd%"
    popd
) else (
    echo [ERROR] Not inside a Git repository.
    exit /b 1
)

set "DEST=%GITROOT%\.git\hooks"

echo --------------------------------------------------
echo 🔧 Syncing Git hooks to %DEST%
echo 📅 Last Modified: %TODAY%
echo --------------------------------------------------

pushd "%HOOKS_DIR%"

for %%F in (*) do (
    rem Skip excluded files and directories
    if /I not "%%F"=="%EXCLUDE%" if exist "%%F" (
        set "SRC=%%F"
        set "DST=%DEST%\%%F"

        rem Update "Last Modified: {{YYYY-MM-DD}}" in SRC and DST
        powershell -Command "(Get-Content '!SRC!') -replace 'Last Modified: \{\{[0-9\-]*\}\}', 'Last Modified: %TODAY%' | Set-Content '!SRC!'"

        if not exist "!DST!" (
            copy /Y "!SRC!" "!DST!" >nul
            echo 📥 Copied new hook: %%F
        ) else (
            rem Compare file modification dates (date only, no time granularity)
            for %%A in ("!SRC!") do set "SRC_DATE=%%~tA"
            for %%B in ("!DST!") do set "DST_DATE=%%~tB"
            if "!SRC_DATE!" GTR "!DST_DATE!" (
                copy /Y "!SRC!" "!DST!" >nul
                echo 🔄 Updated hook (newer): %%F
            ) else (
                echo ✅ Up-to-date: %%F
            )
        )
        powershell -Command "(Get-Content '!DST!') -replace 'Last Modified: \{\{[0-9\-]*\}\}', 'Last Modified: %TODAY%' | Set-Content '!DST!'"
    )
)

popd

echo --------------------------------------------------
echo ✅ Hook installation complete.
pause
