@echo off
setlocal

echo ============================================
echo  Bluewater Docs: MkDocs Deploy to GitHub Pages
echo ============================================

REM Ensure Python is installed
where python >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not on PATH.
    pause
    exit /b 1
)

REM Ensure pip is installed
where pip >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pip is not installed or not on PATH.
    pause
    exit /b 1
)

REM Install MkDocs and Material theme if needed
pip show mkdocs >nul 2>&1
if errorlevel 1 (
    echo [INFO] Installing MkDocs and MkDocs-Material...
    pip install mkdocs mkdocs-material
)

REM Check for mkdocs.yml
if not exist mkdocs.yml (
    echo [ERROR] mkdocs.yml not found in current directory!
    pause
    exit /b 1
)

REM Deploy docs
echo [INFO] Deploying to GitHub Pages using MkDocs...
mkdocs gh-deploy --force

if errorlevel 1 (
    echo [ERROR] MkDocs deploy failed.
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Docs deployed to GitHub Pages!
echo Visit your repository's Settings > Pages to set the source if this is your first deployment.
echo.

pause
endlocal
