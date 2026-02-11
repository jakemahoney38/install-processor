@echo off
setlocal
echo Starting Eagle River Invoice Processor...

:: Get the directory where this script is located
set "USB_PATH=%~dp0"
cd /d "%USB_PATH%"

:: Start the server in a hidden/minimized window on port 8000
start /min "" "Run_ERIP.exe" -p 8000 -r .

:: Give the server a moment to start
timeout /t 1 /nobreak > nul

:: Open the browser to localhost
:: Browsers allow PWA Installation on http://localhost even without HTTPS
start http://localhost:8000

echo.
echo [App is running at http://localhost:8000]
echo.
echo To stop the server, just close this window.
pause > nul

:: Clean up: Kill the server when the batch window is closed
taskkill /f /im Run_ERIP.exe > nul 2>&1