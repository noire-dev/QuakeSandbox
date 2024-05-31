@echo off
setlocal enabledelayedexpansion

set "milab_dir=%~dp0MiLab"

if not exist "%milab_dir%\" (
    echo Milab folder not found.
    pause
    exit /b
)

cd /d "%milab_dir%"

for /d %%D in (*) do (
    if "%%D"=="." (
        continue
    )
    echo %%D | findstr /r "\." >nul
    if not errorlevel 1 (
        set "archive_name=a_%%D.zip"
        set "archive_done=a_%%D"
        set "temp_archive_name=a_%%D.tmp"
        set "archive_path=%milab_dir%\!archive_name!"
        set "temp_archive_path=%milab_dir%\!temp_archive_name!"

        if "!archive_path!" == "" (
            echo Error: Archive location not set.
            pause
            exit /b
        )

        echo Archive %%D in !archive_path!
        powershell.exe -Command "Compress-Archive -Path '%%D\*' -DestinationPath '!archive_path!'"
        ren "!archive_path!" "!temp_archive_name!"
		rm "!archive_done!"
        ren "!temp_archive_path!" "!archive_done!"
    )
)

echo Done!
pause
