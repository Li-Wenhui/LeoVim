@rem ==================================================================
@rem
@rem Latest compiled vim: https://tuxproject.de/projects/vim/
@rem
@rem ==================================================================


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
echo���������U    1 : ����Ϊ32λgvim��                              �U
echo���������U    2 : ����Ϊ64λgvim��                              �U
echo���������U    3 : ����Ҽ���ݲ˵�                              �U
echo���������U    4 : ɾ���Ҽ���ݲ˵�                              �U
echo���������U    5 : �ֿⰲװ                                      �U
echo���������U    0 : �˳���                                        �U
echo���������c�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�f
echo���������U��         WIN8/WIN10����Ҫ�Թ���Ա������д�������!  �U
echo���������t�������������������������������������������������������s
echo.

set xz=
set /p xz=��ѡ���(1��2��3��4��5��0)��
if /i "%xz%"=="1" goto :inst32
if /i "%xz%"=="2" goto :inst64
if /i "%xz%"=="3" goto :addreg
if /i "%xz%"=="4" goto :delreg
if /i "%xz%"=="5" goto :instfont
if /i "%xz%"=="0" goto :end
echo ���벻��ȷ �����¿�ʼ... & goto start

:inst32
if not exist "%filePath%vim74\complete-x86.7z" echo. &echo û���ҵ�vim74_x86.zip! �밴������ص����˵�... &pause>nul &goto start
cd "%filePath%vim74"
7z x -y complete-x86.7z
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:inst64
if not exist "%filePath%vim74\complete-x64.7z" echo. &echo û���ҵ�vim74_x64.zip! �밴������ص����˵�... &pause>nul &goto start
cd "%filePath%vim74"
7z x -y complete-x64.7z
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:addreg
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim"
reg add "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim\command" /v "" /t "REG_SZ" /d "\"%filePath%vim74\gvim.exe\" -p --remote-tab-silent \"%%1%\"" /f
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:delreg
reg delete "HKEY_CLASSES_ROOT\*\shell\Edit with &Vim" /f
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:instfont
if not exist "%filePath%fonts\DejaVuSansMonoforPowerline_NF.ttf" echo. &echo û���ҵ�fonts�ļ���! �밴������˳�... &pause>nul &exit
copy /y %filePath%fonts\*.* %fontsdir%*.* 
echo ������ɣ��밴������ص����˵�... &pause>nul
goto start

:end
echo.
echo.
echo                ���ճ�
echo.
echo               �q�Шr�衡���������� �q�T�T�r   ǣ����
echo               �q�q �Шr ��q��r �q�sLeo �U
echo               �t ----�s/���Ũ�\  �t�ѨT�Ѩs       ȥ����
echo               ~~~~~~~~~~��~~��~~~~~~~~~~~.
echo.
echo.
echo ������ɣ��밴������˳�... &pause>nul &exit
