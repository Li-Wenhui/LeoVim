@echo off
set filePath=%~dp0
set fontsdir=%SystemRoot%\Fonts\
if not exist "%filePath%undodir" mkdir undodir

:start
cls
@rem color 0E 
title=gvim���ù���
echo.
echo��������������   �q�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�r
echo��������������  �U������������������������������������  �U
echo�������� �q�T�T=�� gvim x86/x64 ����ȷ��    Win10�²��� ��=�T�T�r
echo���������U����  �U������������������������������������  �U��    �U
echo���������U����  �t�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�s��    �U
echo���������c�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�f
echo���������U  ����ѡ��:��                                         �U
echo���������U    1 : ����Ҽ���ݲ˵�                              �U
echo���������U    2 : ɾ���Ҽ���ݲ˵�                              �U
echo���������U    3 : �ֿⰲװ                                      �U
echo���������U    0 : �˳���                                        �U
echo���������c�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�f
echo���������U��     WIN8/WIN10�¿�����Ҫ�Թ���Ա������д�������!  �U
echo���������t�������������������������������������������������������s
echo.

set xz=
set /p xz=��ѡ���(1��2��3��0)��
if /i "%xz%"=="1" goto :addreg
if /i "%xz%"=="2" goto :delreg
if /i "%xz%"=="3" goto :instfont
if /i "%xz%"=="0" goto :end
echo ���벻��ȷ �����¿�ʼ... & goto start

:addreg
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim"
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim\command" /v "" /t "REG_SZ" /d "\"%filePath%vim80\gvim.exe\" -p --remote-tab-silent \"%%1%\"" /f
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:delreg
reg delete "HKEY_CLASSES_ROOT\*\shell\Edit with &gVim" /f
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:instfont
if not exist "%filePath%fonts\Microsoft YaHei Mono.ttf" echo. &echo û���ҵ�fonts�ļ���! �밴������˳�... &pause>nul &exit
copy /y %filePath%fonts\*.ttf %fontsdir%*.ttf 
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:end
echo.
echo                      ���ճ�
echo.
echo                     �q�Шr�衡���������� �q�T�T�r   ǣ����
echo                     �q�q �Шr ��q��r �q�sLeo �U
echo                     �t ----�s/���Ũ�\  �t�ѨT�Ѩs       ȥ����
echo                     ~~~~~~~~~~��~~��~~~~~~~~~~~.
echo.
echo �����˳������Ժ�(Waiting to exit) ...
ping -n 2 127.1>nul
exit
