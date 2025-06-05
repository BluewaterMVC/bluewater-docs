@echo off
REM Auto-generate .pages files in each subfolder of docs\
REM Must be run from the root of your repo where docs\ lives

SETLOCAL ENABLEDELAYEDEXPANSION

REM Loop through each directory under docs (including docs itself)
for /r docs %%D in (.) do (
    REM Check if it is a directory
    if exist "%%D\" (
        REM Change to that directory
        pushd "%%D"

        REM List .md files in this directory
        dir /b *.md > files.tmp

        REM Only proceed if there are .md files
        if exist files.tmp (
            echo title: %%~nxD > .pages
            echo order: >> .pages
            for /f "delims=" %%F in (files.tmp) do (
                echo   - %%F >> .pages
            )
            del files.tmp
            echo Created .pages in %%D
        )

        popd
    )
)

ENDLOCAL
echo Done generating .pages files.
pause
