@echo off
SETLOCAL EnableDelayedExpansion
echo %* 
REM --------------------------%* Is the FULL AnyDesk List! 

set /p "name=insert file name:"

REM ------------------------------------------completed
echo set string=%* > !name!.bat
echo set "count=0" >> !name!.bat
echo for %%%%a in ^("%%string:,=" "%%%") do ( >> !name!.bat
echo set /A count+=1 >> !name!.bat
echo start "" /D "C:\Users\%username%\Desktop\OPAnyDesk" cmd /C AnyRun.bat %%%%a >> !name!.bat
echo ) >> !name!.bat
pause