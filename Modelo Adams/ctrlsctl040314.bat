set MDI_ADAMS_ACF=
set MDI_ADAMS_ALL_VARIABLES=on

set OPATH=%PATH%
PATH=%SHORT_TOPDIR%win64\%UCONFG_DIR%;%SHORT_TOPDIR%win64;%OPATH%;
if not "%MDI_VCONTROLS_BATCH%" == "" set MDI_AVIEW_GRAPHICS=Batch
echo.
echo Begin execution of Adams Controls (view)...
echo.
"D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\controls\win64\vcontrols.exe" 10648   
set PATH=%OPATH%
set OPATH=
set MDI_AVIEW_GRAPHICS=