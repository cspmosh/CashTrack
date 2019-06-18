cls
@ECHO OFF
ECHO.
ECHO Starting up the Cashtrack Production Server 
ECHO.
CD C:\Cashtrack
ruby script\server webrick -e production -p 80