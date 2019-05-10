echo Deleting user data

:: deleting usr data on win
del "%USERPROFILE%\Desktop\*.*" /F /Q
del "%USERPROFILE%\Downloads\*.*" /F /Q
del "%USERPROFILE%\Documents\*.*" /F /Q
del "%USERPROFILE%\Pictures\*.*" /F /Q
del "%USERPROFILE%\Videos\*.*" /F /Q

:: delete all usrnames and passwds in the windows credentials manager
cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

:: create shortcut to chrome usr dir
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

:: delete history files and cache
del /q /s /f "%ChromeDir%\default\History*.*"
del /q /s /f "%ChromeDir%\default\Cache\*.*"

:: alternatively, uncomment and link the chrome-clean.ps1 powershell script for a deeper clean
:: swap out location for your location
:: PowerShell -NoProfile -ExecutionPolicy Bypass -File 'C:\location\chrome-clean.ps1'
