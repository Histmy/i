@echo off
chcp 65001
cls

echo Vítejte ve skvělém inicializačním skriptu od Histmyho.
echo Tento suprový skript Vám pomůže nainstalovat důležité programy bez použití dokurvenýho edže
echo.

pause
cls

call :activate
call :firefox
call :shutup10
call :discord

:activate
choice /n /m "Chcete aktivovat Windows? [y/n]:"
if %errorlevel% == 2 (cls & goto :eof)
net session >NUL 2>NUL
if %errorlevel% == 2 goto notadmin
echo zkouším aktivovat...
cscript //nologo slmgr.vbs /upk >nul & cscript //nologo slmgr.vbs /cpky >nul & wmic os | findstr /I "enterprise" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul&cscript //nologo slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul&cscript //nologo slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul&cscript //nologo slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul&cscript //nologo slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ >nul&cscript //nologo slmgr.vbs /ipk QFFDN-GRT3P-VKWWX-X7T3R-8B639 >nul) else wmic os | findstr /I "10 pro" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul&cscript //nologo slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul) else wmic os | findstr /I "home" >nul
if %errorlevel% EQU 0 (cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul&cscript //nologo slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul&cscript //nologo slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul&cscript //nologo slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul)
set i=1
:server
if %i%==1 set KMS_Sev=kms7.MSGuides.com
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms9.MSGuides.com
if %i%==4 goto nefukuje
cscript //nologo slmgr.vbs /skms %KMS_Sev% >nul
cscript //nologo slmgr.vbs /ato | find /i "successfully" || (set /a i+=1 & goto server)
echo Úspěšně aktivováno!
pause
cls
goto :eof

:nefukuje
echo Bohužel, aktivace se nezdařila
pause
cls
goto :eof

:notadmin
echo Bohužel, aby jste mohli windowjsy aktivovat musíte tento skript spustit jako administrátora
echo Pokud nechcete pokračovat a zkusit to znovu, okno jednoduše zavřete
pause
cls
goto :eof


:download
choice /n /m "Chcete stáhnout %name%? [y/n]:"
if %errorlevel% == 2 (cls & goto :eof)
curl -L -o "%tmp%\%name%.exe" "http://%link%"
"%tmp%\%name%.exe"
cls
goto :eof

:msstore
choice /n /m "Chcete otevřít store stránku s %name%? [y/n]:"
if %errorlevel% == 2 (cls & goto :eof)
start "ms-windows-store://pdp/?ProductId=%link%"
cls
goto :eof

:firefox
set name=firefox
set "link=download.mozilla.org/?product=firefox-stub&os=win"
call :download
goto :eof

:shutup10
set name=ShutUp10
set link=dl5.oo-software.com/files/ooshutup10/OOSU10.exe
call :download
goto :eof

:eartrumpet
set name=EarTrumpet
set link=9NBLGGH516XP
call :msstore
goto :eof

:discord
set name=Discord
set "link=discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
call :download
goto :eof
