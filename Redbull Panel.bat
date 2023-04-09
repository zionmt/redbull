@echo off
:findupdater
if not exist "Updater.bat" cls & goto r else goto deleteupdater
:deleteupdater
echo Redbull Panel has detected the updater in this folder. Would you like to delete it? (it is no longer needed)
echo (Y/N)
set /p d=
IF %d%==Y goto delup
IF %d%==N goto r
:findinstaller
if not exist "Redbull-Installer.bat" cls & goto r else goto deleteinstaller
:deleteinstaller
cls
echo Redbull Panel has detected the installer in this folder. Would you like to delete it? (it is no longer needed)
echo (Y/N)
set /p c=
IF %c%==Y goto confdel
IF %c%==N goto r
:confdel
del /f "Redbull-Installer.bat"
if exist "Redbull-Installer.bat" echo Could not be deleted successfully. Ensure it is closed and manually delete.
echo The installer has been deleted. Starting the panel now.
:delup
del /f "Updater.bat"
if exist "Updater.bat" echo Could not be deleted successfully. Ensure it is closed and manually delete.
echo The updater has been deleted. Starting the panel now.
timeout /t 2 /nobreak >nul
goto r
:r
cls
mode con:cols=112 lines=42
echo                       d8b  d8b                d8b  d8b                               
echo                       88P  ?88                88P  88P                               
echo                      d88    88b              d88  d88                                
echo   88bd88b d8888b d888888    888888b ?88   d8P888  888                                
echo   88P'  `d8b_,dPd8P' ?88    88P `?8bd88   88 ?88  ?88                                
echo  d88     88b    88b  ,88b  d88,  d88?8(  d88  88b  88b                               
echo d88'     `?888P'`?88P'`88bd88'`?88P'`?88P'?8b  88b  88b                              
timeout /t 2 /nobreak >nul
echo Welcome to the Redbull Panel v4.1.0
echo A fine release by KitchenerMT
timeout /t 1 /nobreak >nul
:a
echo ______________________________
echo.
echo Notes
echo ______________________________
echo.
echo This panel relies completely on Git, so make sure you have it installed.
echo ______________________________
echo.
echo Updates
echo ______________________________
echo.
echo Update menu integrated into Panel. (4.1.0)
echo Added a version checker
echo ______________________________
echo.
echo Menus
echo ______________________________
echo.
echo 1. Pinger
echo 2. SSH Remote Access
echo 3. Update
echo 4. Check Version
echo ______________________________
echo.
echo Commands
echo ______________________________
echo.
echo CLS to clean the panel

set /p a=
IF %a%==1 goto cachecheckping
IF %a%==2 goto cachecheckssh
IF %a%==3 start update.bat
IF %a%==4 goto :checkversion
if %a%==CLS cls & echo Panel cleaned. & goto a

:makecachefolder
cls
git clone https://github.com/ifindu19/redbull-menus.git
mkdir menucache
move redbull-menus menucache
echo dont worry the menus are just stored here, if this folder is deleted then the menus get reinstalled > whatisthisfolderisitavirus.txt
move whatisthisfolderisitavirus.txt menucache
cls
echo The panel will restart in 2 seconds.
timeout /t 2 /nobreak >nul
goto r

:cachecheckping
if not exist menucache goto makecachefolder
if exist menucache goto startping

:cachecheckssh
if not exist menucache goto makecachefolder
if exist menucache goto startssh

:startping
start menucache\redbull-menus\ping.bat
goto r

:startssh
start menucache\redbull-menus\sshlogin.bat
goto r

:checkversion
if not exist repofolder mkdir repofolder & goto mkclone else goto statuscheck

:mkclone
cd %cd%\repofolder
git clone https://github.com/ifindu19/redbull.git
cd redbull
goto statuscheck
:statuscheck            
cls 
echo If it says "Your branch is up to date" then your on the current version (v4.2.0)
echo If it doesnt, your not on the latest version.
timeout /t 1 /nobreak >nul
git status
timeout /t 2 /nobreak >nul
echo Press a key to go back to menu.
pause >nul
cls
goto r                                                                               

                                                                                     
                                                                                     
                                                                                     