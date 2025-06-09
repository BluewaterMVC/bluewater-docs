@echo off
setlocal EnableDelayedExpansion

:: Assume script is run from inside \docs
cd /d %~dp0

:: Define full paths
set "CHANGELOG=changelog.md"
set "TMP=changelog.tmp"
set "HEAD=changelog.head"

:: Create changelog.md if it doesn't exist
if not exist %CHANGELOG% (
    echo ### 📘 `docs/changelog.md` — Bluewater Documentation Changelog > %CHANGELOG%
    echo. >> %CHANGELOG%
    echo # 📅 Bluewater Documentation Changelog >> %CHANGELOG%
    echo. >> %CHANGELOG%
    echo 📄 **File:** `docs/changelog.md`  >> %CHANGELOG%
    echo 📅 **Status:** Active  >> %CHANGELOG%
    echo 🏷️ **Tags:** changelog, documentation, revision history  >> %CHANGELOG%
    echo 🔖 **Version:** 1.0  >> %CHANGELOG%
    echo 🌍 **Scope:** Track all document-level changes across the entire `docs/` directory, including architecture, RFCs, platform references, and contributor guidance  >> %CHANGELOG%
    echo 🤝 **Contributors:** – Technical leads, documentation maintainers, and platform architects  >> %CHANGELOG%
    echo 👨‍💻 **Author:** Walter Torres  >> %CHANGELOG%
    echo. >> %CHANGELOG%
    echo --- >> %CHANGELOG%
    echo. >> %CHANGELOG%
    echo ^> ### 🪶 **Bluewater Principle**  >> %CHANGELOG%
    echo ^> *If it wasn’t documented, it didn’t happen.*  >> %CHANGELOG%
    echo. >> %CHANGELOG%
)

:: Start new log block
echo ## 🧾 Log Entries > %TMP%
echo. >> %TMP%
echo ^| Date       ^| Type     ^| File                          ^| Description                              ^| >> %TMP%
echo ^|------------^|----------^|-------------------------------^|------------------------------------------^| >> %TMP%

:: Traverse all .md files recursively from parent
for /f "delims=" %%F in ('dir /b /s "..\*.md"') do (
    set "FILE=%%~F"
    set "NAME=%%~nxF"
    set "REL=%%F"
    set "REL=!REL:%~dp0..\\=!"
    set "REL=!REL:\=/!"

    for %%A in ("%%F") do (
        set "RAW=%%~tA"
    )

    call :FormatDate "!RAW!" DATE

    echo ^| !DATE! ^| Modified ^| !REL! ^| [AUTO] Detected or updated via script ^| >> %TMP%
)

:: Combine preserved head with updated log
findstr /B /V "## 🧾 Log Entries" %CHANGELOG% > %HEAD%
type %HEAD% > %CHANGELOG%
echo. >> %CHANGELOG%
type %TMP% >> %CHANGELOG%

:: Cleanup
del %HEAD%
del %TMP%

echo 🔄 Changelog updated: %CD%\%CHANGELOG%
exit /b

:FormatDate
setlocal
set "raw=%~1"
for /f "tokens=1-3 delims=/ " %%a in ("%raw%") do (
    endlocal
    set "%~2=%%c-%%a-%%b"
)
exit /b
