set MDI_ADAMS_ACF=
set MDI_ADAMS_SCONTROLS_APPLICATION=1
set MDI_ONLINE_DIR=C:\Program Files\MSC.Software\Adams\2020_711253\help\
set MDI_ADAMS_MSGS=C:\Program Files\MSC.Software\Adams\2020_711253\common\win64\messages.dac
set MDI_ADAMS_HELP=C:\Program Files\MSC.Software\Adams\2020_711253\common\win64\helpmsgs.dac
set MDI_AVIEW_MESSAGES=C:\Program Files\MSC.Software\Adams\2020_711253\common\win64\aview.msg
echo.
echo Begin execution of Adams Controls (solver)...
echo.
"C:\Program Files\MSC.Software\Adams\2020_711253\controls\win64\scontrols.exe" 269241  
set MDI_ADAMS_MSGS=
set MDI_ADAMS_SCONTROLS_APPLICATION=
set MDI_ADAMS_HELP=
set MDI_AVIEW_MESSAGES=
set MDI_ONLINE_DIR=
if "%MDI_PAUSE%" == "1" pause
