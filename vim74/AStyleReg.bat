@echo off
if not exist "%~dp0AStyle.exe" echo �������AStyle.exe����ͬһĿ¼��! &echo �밴������˳� &pause>nul &exit

:start
cls
color 0E 
title=����������,�Ҽ��˵���װж�س���
echo��������������  �q�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�r
echo��������������  �U������������������������������������  �U
echo���������q�T�T�T�ȴ�������      ��װ˵��     Win8�²��� ���T�T�T�r
echo���������U����  �U������������������������������������  �U��    �U
echo���������U����  �t�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�s��    �U
echo���������U���޸��ļ���Ŀ¼�Ҽ��˵�,Ҳ���Ҽ����͵�SendTo         �U
echo���������c�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�f
echo���������U  ����1.��װ��                                        �U
echo���������U  ����2.ж�ء�                                        �U
echo���������c�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�f
echo���������t�������������������������������������������������������s
set xz=
set /p xz=��ѡ���(1��2)��
if /i "%xz%"=="1" goto :inst
if /i "%xz%"=="2" goto :uninst
echo ���벻��ȷ �����¿�ʼ & ping -n 3 127.1>nul & goto start

:inst
cd /d %~dp0
copy /y AStyleAll.bat "C:\Users\Default\AppData\Roaming\Microsoft\Windows\SendTo\AStyleAll.bat"
set filePat=%~dp0
reg add "HKEY_CLASSES_ROOT\Directory\shell\AStyle" /v "" /d "&AS��������" /f 
reg add "HKEY_CLASSES_ROOT\Directory\shell\AStyle\command" /v "" /d "%filePat%AStyleAll.bat \"%%1%\"" /f
reg add "HKEY_CLASSES_ROOT\*\shell\AStyle" /v "" /d "&AS��������" /f 
reg add "HKEY_CLASSES_ROOT\*\shell\AStyle\command" /v "" /d "%filePat%AStyleAll.bat \"%%1%\"" /f
goto end

:uninst
del /q "C:\Users\Default\AppData\Roaming\Microsoft\Windows\SendTo\AStyleAll.bat"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\AStyle" /f
reg delete "HKEY_CLASSES_ROOT\*\shell\AStyle" /f
goto end

:end
echo.
echo.                      ���ճ�
echo.
echo                     �q�Шr�衡���������� �q�T�T�r   ǣ����
echo                     �q�q �Шr ��q��r �q�sDiy �U
echo                     �t ----�s/���Ũ�\  �t�ѨT�Ѩs       ȥ����
echo                     ~~~~~~~~~~��~~��~~~~~~~~~~~.
ping -n 10 127.1>nul
exit
