@echo off                                                                                                                                                                 

cls
echo To update the updater, run the installer again.
echo Note - make sure Git is installed. Type N to go to the download page and exit.
echo Do you want to continue?
echo Type update to update the updater.
echo (Y/N/Update)
set /p a=
if %a%==Y goto update
if %a%==N start https://git-scm.com/download/win & exit
if %a%==Update goto selfupdate

:update
git clone https://github.com/ifindu19/redbull.git
move "redbull\Redbull Panel.bat" %cd%
rmdir /s /q redbull
exit

:selfupdate
git clone https://github.com/ifindu19/redbull.git
move "redbull\Updater.bat" %cd%
rmdir /s /q redbull
exit


