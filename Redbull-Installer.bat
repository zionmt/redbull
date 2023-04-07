@echo off

echo You are installing Redbull v3.
echo Please make sure you have Git installed, otherwise the updater will not work.
echo Type Y to install, type N to exit, type Git to open the Git install page.
echo (Y/N/Git)
set /p a=
if %a%==Y goto update
if %a%==N exit
if %a%==Git start https://git-scm.com/download/win & exit

:update
git clone https://github.com/ifindu19/redbull.git
move "redbull\Redbull Panel.bat" %cd%
move "redbull\Updater.bat" %cd%
rmdir /s /q redbull
del /f "Redbull Installer.bat"