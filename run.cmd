@ECHO off
IF NOT DEFINED IS_CHILD_PROCESS (CMD /K SET IS_CHILD_PROCESS=1 ^& %0 %*) & EXIT )
TITLE EeveeOrigins
CLS
COLOR 0F
ECHO.

SET cwd=%~dp0

ECHO [EeveeOrigins]: Checking System...
IF EXIST Origins.js (
  ECHO [Origin Manager]: System Checked. O7. Booting up...
  node .
) ELSE (
  TITLE [ERROR] System Check Failed
  ECHO [EeveeOrigins]: System check failed. Check if you have the bot installed correctly.
  GOTO :EXIT
)
ECHO.

EXIT /B 0

:EXIT
ECHO.
ECHO [EeveeOrigins]: Press any key to exit.
PAUSE >nul 2>&1
CD /D "%cwd%"
TITLE Windows Command Prompt (CMD)
COLOR
