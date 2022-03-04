:: Script: robocopyAutomate.bat              
:: Author: Devin Iverson         
:: Date of latest revision: 03/03/22     
:: Purpose: 

@echo off

:: robocopy command to copy the MyProjectFiles folder and put the copies into the BackupFolder. Also a log is created showing all files that were copied each time script is ran.
ROBOCOPY C:\Users\j.thompson\Desktop\MyProjectFiles E:\BackupFolder /E /LOG+:E:\copylog.log

Log File : E:\copylog.log
exit