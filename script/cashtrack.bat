cls
@ECHO OFF
ECHO.
ECHO Starting the CashTrack Web Server
ECHO.
START /min "C:\cashtrack\script\" "start_server.bat"
@ping 127.0.0.1 -n 8 > nul
ECHO Opening Cashtrack in internet browser
@ping 127.0.0.1 -n 2 > nul
start /min "cmd" "http://cashtrack/"
EXIT