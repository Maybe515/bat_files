@echo off

rem ===================
rem   �Ǘ��Ҍ��� �m�F
rem ===================
  openfiles > nul 2>&1
  if %ErrorLevel%==1 (
    echo �Ǘ��Ҍ���������܂���B�Ǘ��Ҍ����Ŏ��s���Ă��������B
    pause
    exit
  )

rem ========================
rem   �V�X�e���t�@�C���C��	
rem ========================
:SYSCHK
  set /p ANSWER="�V�X�e���t�@�C���̏C�����s���܂��B��낵���ł����H (Y/N): "

  if "%ANSWER%"=="y" (
    echo\
  ) else if "%ANSWER%"=="Y" (
    echo\
  ) else (
    if "%ANSWER%"=="n" goto END
    if "%ANSWER%"=="N" goto END
    goto SYSCHK
  )

  echo sfc /scannow �����s
  sfc /scannow
  echo\

  echo dism /Online /Cleanup-Image /RestoreHealth �����s
  dism /Online /Cleanup-Image /RestoreHealth
  echo\

  echo ���ׂẴV�X�e���X�L�������������܂����B
  echo\

rem ===============
rem   �ċN�� �m�F
rem ===============
:REBCHK
  set /p REBOOT="�R���s���[�^���ċN�����܂����H (Y/N): "

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
  echo �v���Z�X���I�����܂��B
  echo\
  pause
  exit

:REBOOT
  echo 5�b��ɍċN�����܂��B
  shutdown -r -t 5