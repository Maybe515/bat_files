@echo off

rem ===================
rem   管理者権限 確認
rem ===================
  openfiles > nul 2>&1
  if %ErrorLevel%==1 (
    echo 管理者権限がありません。管理者権限で実行してください。
    pause
    exit
  )

rem ========================
rem   システムファイル修正	
rem ========================
:SYSCHK
  set /p ANSWER="システムファイルの修正を行います。よろしいですか？ (Y/N): "

  if "%ANSWER%"=="y" (
    echo\
  ) else if "%ANSWER%"=="Y" (
    echo\
  ) else (
    if "%ANSWER%"=="n" goto END
    if "%ANSWER%"=="N" goto END
    goto SYSCHK
  )

  echo sfc /scannow を実行
  sfc /scannow
  echo\

  echo dism /Online /Cleanup-Image /RestoreHealth を実行
  dism /Online /Cleanup-Image /RestoreHealth
  echo\

  echo すべてのシステムスキャンが完了しました。
  echo\

rem ===============
rem   再起動 確認
rem ===============
:REBCHK
  set /p REBOOT="コンピュータを再起動しますか？ (Y/N): "

  if "%REBOOT%"=="y" (
    goto REBOOT
  ) else if "%REBOOT%"=="Y" (
    goto REBOOT
  ) else (
    if "%REBOOT%"=="n" goto END
    if "%REBOOT%"=="N" goto END
    goto REBCHK
  )

:END
  echo プロセスを終了します。
  echo\
  pause
  exit

:REBOOT
  echo 5秒後に再起動します。
  shutdown -r -t 5