@echo off
set /a _Debug=0
::==========================================
:: Get Administrator Rights
set _Args=%*
if "%~1" NEQ "" (
  set _Args=%_Args:"=%
)
fltmc 1>nul 2>nul || (
  cd /d "%~dp0"
  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~dpnx0"" ""%_Args%""", "", "runas", 1 > "%temp%\GetAdmin.vbs"
  "%temp%\GetAdmin.vbs"
  del /f /q "%temp%\GetAdmin.vbs" 1>nul 2>nul
  exit
)
::==========================================
@shift /0
CLS
@COLOR b
@echo off

takeown /f "%SystemRoot%\System32\drivers\etc\hosts" /a

icacls "%SystemRoot%\System32\drivers\etc\hosts" /grant administrators:F

attrib -h -r -s "%SystemRoot%\System32\drivers\etc\hosts"

SET NEWLINE=^& echo.

FIND /C /I "www.eassos.com.w.kunlunsl.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1	www.eassos.com.w.kunlunsl.com>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "47.246.3.228" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1	47.246.3.228>>%WINDIR%\system32\drivers\etc\hosts

FIND /C /I "internal.eassos.com.w.kunlunsl.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1	internal.eassos.com.w.kunlunsl.com>>%WINDIR%\system32\drivers\etc\hosts

@exit

