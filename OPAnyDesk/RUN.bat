@echo off

REM _____________________________________________________count blocks by "," delimiter
set /p "string=Insert AnyDesk number:"
set "count=0"

for %%a in ("%string:,=" "%") do set /A count+=1 

REM _____________________________________________________parse and start sessions
for %%a in ("%string:,=" "%") do (
echo %%a
start "" /D "%cd%" cmd /C AnyRun.bat %%a

)
echo %count% addresses.

REM _____________________________________________save auto batch file

set /p "save=Do you wish to save the following desks, my lord? (y/n)"
if '%save%'=='n' echo pause
if '%save%'=='y' (

cmd /C makeNewAnyFile.bat %string%

)

pause
