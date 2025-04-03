@echo off
netsh interface ipv4 set address name="イーサネット" source=static address=xxx.xxx.xxx.xxx mask=xxx.xxx.xxx.xxx gateway=xxx.xxx.xxx.xxx
netsh interface ipv4 set dns name="イーサネット" source=static address=xxx.xxx.xxx.xxx register=primary validate=no
netsh interface ipv4 add dns name="イーサネット" address=xxx.xxx.xxx.xxx index=2 validate=no
pause
