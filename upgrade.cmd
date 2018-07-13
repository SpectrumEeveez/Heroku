@ECHO off
IF NOT DEFINED IS_CHILD_PROCESS (CMD /K SET IS_CHILD_PROCESS=1 ^& %0 %*) & EXIT )
TITLE EeveeOrigins Bot
CLS
COLOR 0F
ECHO.

SET cwd=%~dp0
CD /D %cwd%

ECHO [EeveeOrigins]: Welcome, %USERNAME%!
ECHO.

IF EXIST data\EeveeOrigins.sqlite (
  SETLOCAL ENABLEDELAYEDEXPANSION
  FOR /F %%i in ('powershell -Command "Get-Date -format yyMMddHHmm (Get-Item data\Bastion.sqlite).LastWriteTime"') do SET modifiedDate=%%i
  ECHO [EeveeOrigins]: Backing up database to backup_!modifiedDate!.sqlite...
  REN data\Bastion.sqlite "backup_!modifiedDate!.sqlite"
)

ECHO [EeveeOrigins]: Updating EeveeOrigins Bot...
git pull origin stable 1>nul || (
  ECHO [EeveeOrigins]: Unable to update the bot.
  GOTO :EXIT
)
ECHO [EeveeOrigins]: Done.
ECHO.

ECHO [EeveeOrigins]: Deleting old files...
RD /S /Q node_modules 2>nul
DEL /Q data/EeveeOrigins.sqlite package-lock.json 2>nul
ECHO [EeveeOrigins]: Done.
ECHO [EeveeOrigins]: Installing new files...
choco upgrade chocolatey -y
choco upgrade ffmpeg -y
CALL npm i --only=production --no-package-lock >nul 2>update.log
ECHO [EeveeOrigins]: Done.
ECHO [EeveeOrigins]: If you get any errors please check the update.log file for errors while updating.
ECHO [EeveeOrigins]: Ready to boot up and start running.
ECHO.

EXIT /B 0

:EXIT
ECHO.
ECHO [EeveeOrigins]: If you faced any issues during any steps, join my official server and our amazing support staffs will help you out.
ECHO [EeveeOrigins]: Stay updated about new releases, important announcements, a lot of other things and giveaways too!
ECHO [EeveeOrigins]: Discord Not Avail
ECHO.
ECHO [EeveeOrigins]: Press any key to exit.
PAUSE >nul 2>&1
CD /D "%cwd%"
TITLE Windows Command Prompt (CMD)
COLOR
