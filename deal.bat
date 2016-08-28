@echo off 
color F0
title 批量拷贝图片文件

set work_path=%cd% 
set "st=this is a test" 
cd %work_path% 

echo 创建文件夹 1-9
for /l %%a in (1 1 9) do (
	md %%a 
)

set sum=0

for %%s in (*.png) do ( 
	 set /a sum+=1
) 

set /a size=%sum%/9

echo 总文件个数:%sum%
echo 每个文件夹下文件的个数:%size%

:设置本地变量(bat语法中必须添加这个设置，才能在循环中获取变量值)
SETLOCAL ENABLEDELAYEDEXPANSION   
:等号与赋值之间没有空格
set i =0                          
for %%s in (*.png) do ( 
	:取余运算，判断该放在哪个目录下
	set /a n = !i! %% !size!      
	if !n! equ 0 (
		set /a path+=1
		echo !path!
	)
	:拷贝文件到相应目录下
	copy /y %%s %cd%\!path!       
	:循环变量
	set /a i+=1                   
)


pause 
