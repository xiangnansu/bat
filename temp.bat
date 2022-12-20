@echo off
setlocal enableDelayedExpansion

set files=
set directories=

set n=0
for /f %%f in (files.txt) do (
	set files[!n!]=%%f
	set /a n=n+1
)

set n=0
for %%d in (%*) do (
	set directories[!n!]=%%d
	set /a n=n+1
)

for /f "tokens=2 delims==" %%d in ('set directories[') do (

	for /f "tokens=2 delims==" %%f in ('set files[') do (
		set aaa=..\%%d\%%f
		if not exist !aaa! (
			if exist ..\%%d\ rd /q/s ..\%%d
		)
	)
)

endlocal
:end