@echo off
setlocal EnableDelayedExpansion

:: 🗓️ Get today's date in YYYY-MM-DD
for /f %%A in ('powershell -Command "Get-Date -Format yyyy-MM-dd"') do set TODAY=%%A

echo --------------------------------------------------
echo 🔧 Syncing Git hooks to ../.git/hooks
echo 📅 Last Modified: %TODAY%
echo --------------------------------------------------

:: Go to source directory (.githooks/)
pushd %~dp0

:: Loop through all files in current directory (skip setup-hooks.bat itself)
for %%F in (*) do (
    if /I not "%%F"=="setup-hooks.bat" (
        set "SRC=%%F"
        set "DST=..\ .git\hooks\%%F"

        :: If file doesn't exist in hooks folder, copy it
        if not exist "!DST!" (
            echo 📥 Copying new hook: %%F
            copy /Y "!SRC!" "!DST!" >nul
        ) else (
            :: Compare modification dates
            for %%A in (!SRC!) do set "SRC_DATE=%%~tA"
            for %%B in (!DST!) do set "DST_DATE=%%~tB"

            :: If source file is newer
            if "!SRC_DATE:~0,10!" GTR "!DST_DATE:~0,10!" (
                echo 🔄 Updating hook: %%F (Newer version)
                copy /Y "!SRC!" "!DST!" >nul
            ) else (
                echo ✅ Up-to-date: %%F
            )
        )

        :: 🔄 Replace "Last Modified: {{YYYY-MM-DD}}" in both SRC and DST
        powershell -Command "(Get-Content '!SRC!') -replace 'Last Modified: \{\{[0-9\-]*\}\}', 'Last Modified: %TODAY%' | Set-Content '!SRC!'"
        powershell -Command "(Get-Content '!DST!') -replace 'Last Modified: \{\{[0-9\-]*\}\}', 'Last Modified: %TODAY%' | Set-Content '!DST!'"
    )
)

popd
echo --------------------------------------------------
echo ✅ Hook installation complete.
pause
