::--------------------------------------------------------------------
::   ���������Ƕ�С������ Astyle , ��ǰ�汾 Artistic Style 2.05.1
::   �ص�ַ http://sourceforge.net/projects/astyle/files/astyle/
:: �����÷�
:: ������4���ո�Ļ�,�� -s2 �ĳ� -s4
:: �޸Ĳ���--suffix=none��ֱ�Ӳ����ɱ����ļ�(Ҳ�Ͳ���ɾ��)
::--------------------------------------------------------------------

@echo off
title ����������������
echo  �ļ�֧������c,h,cpp ,   ֧��4�ֹ�����ʽ
echo 1˫��ִ��ת����ǰĿ¼����Ŀ¼���ļ�
echo 2��ק����·���ĵ����ļ�
echo 3��ק����·����Ŀ¼
echo 4�Ҽ��ļ���Ŀ¼���͵�sendto
echo.

echo.
cd /d "%~dp1"
set filename=%~nx1
set pats=%~dp1
::�״�ʹ��,���޸������AsPath��·��!!!!!!!!!!!!!!!!!!!!!!!!!
set AsPath="C:\PrgFiles\Vim\vim74\AStyle.exe"

if /i "%~1"=="" goto :doubleClick 
IF EXIST "%~1\" GOTO :dir
if "%filename:~-4%"==".cpp" goto :single
if "%filename:~-2%"==".c"   goto :single
if "%filename:~-2%"==".h"   goto :single
cls
color 0a
ECHO %filename%
ECHO ����Ч�ĺ�׺,��ǰ֧�ֵĺ�׺������c,cpp,h ,Ҫ֧�������������޸Ĳ���
pause
exit

:single
echo --------------------singleFile mode----------------------
ECHO ת���ĵ����ļ�:%filename%
%AsPath% --style=ansi -f -p -X -U -Q -s4 -S -N -L -m0 -M40 -j -c -xe  --suffix=.pre "%filename%"
::�Ͼ��еĲ��������޸�

REM ɾ�����еı����ļ�
REM del *.pre /s /q
pause
exit

:dir
echo ---------------------dir mode-----------------------------
for /r "%~nx1" %%f in (*.cpp;*.c;*.h) do %AsPath% --style=ansi -f -p -X -U -Q -s4 -S -N -L -m0 -M40 -j -c -xe  --suffix=.pre "%%f"
REM ɾ�����еı����ļ�
REM for /r "%~nx1" %%a in (*.pre) do del "%%a"
pause
exit

:doubleClick
echo -------------------doubleClick mode--------------------------
for /r . %%f in (*.cpp;*.c;*.h) do %AsPath% --style=ansi -f -p -X -U -Q -s4 -S -N -L -m0 -M40 -j -c -xe  --suffix=.pre "%%f"
REM ɾ�����еı����ļ�
REM del *.pre /s /q
pause
exit


