@echo off                                                                                                                                                                 

cls
echo To update the updater, run the installer again.
echo Note - make sure Git is installed. Type N to go to the download page and exit.
echo Do you want to continue?
echo (Y/N)
set /p a=
if %a%==Y goto update
if %a%==N start https://git-scm.com/download/win & exit

:update
git clone https://github.com/ifindu19/redbull-download.git
move "redbull-download\Redbull Panel.bat" %cd%
rmdir /s /q redbull-download
