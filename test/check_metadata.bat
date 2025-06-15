@echo off
setlocal EnableDelayedExpansion

:: Description:
:: Checks all Markdown files for:
::   - "Last updated:" line (case insensitive)
::   - CC BY 4.0 License line (case insensitive)
:: Skips files in \phpdoc\ and \node_modules\

set "fail=0"

echo 🔎 Checking Markdown metadata...

for /r %%F in (*.md) do (
    set "file=%%F"
    echo !file! | findstr /I /C:"\phpdoc\" >nul
    if not !errorlevel! == 0 (
        echo !file! | findstr /I /C:"\node_modules\" >nul
        if not !errorlevel! == 0 (
            set "foundUpdated=0"
            set "foundLicense=0"
            findstr /I /C:"Last updated:" "!file!" >nul && set "foundUpdated=1"
            findstr /I /C:"CC BY 4.0 License" "!file!" >nul && set "foundLicense=1"
            set "missing="
            if !foundUpdated! == 0 set "missing=[missing: Last updated] "
            if !foundLicense! == 0 set "missing=!missing![missing: CC BY 4.0 License] "
            if defined missing (
                echo ❌ !file! !missing!
                set "fail=1"
            ) else (
                echo ✅ !file!
            )
        )
    )
)

if "!fail!" == "1" (
    echo ❗ One or more Markdown files are missing required metadata.
    exit /b 1
) else (
    echo 🎉 All Markdown files passed metadata checks.
    exit /b 0
)
