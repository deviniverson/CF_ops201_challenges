:: Script: robocopyAutomate.bat              
:: Author: Devin Iverson         
:: Date of latest revision: 03/03/22     
:: Purpose: 

@echo off

ROBOCOPY C:\Users\j.thompson\Desktop\MyProjectFiles E:\BackupFolder /E /LOG+:E:\copylog.log

Log File : E:\copylog.log
exit