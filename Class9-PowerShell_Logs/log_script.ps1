# Script: log_script.ps1
# Author: Devin Iverson
# Date of latest revision: 03/07/2022
# Purpose: Collect eventlogs, store some in text files on the desktop and to write some on the screen.

# Function that collects all events from the last 24 hours and creates a file last_24.txt, if already exists, replaces with new file.
Function SaveDayLogs
{
process {Get-EventLog -Logname System -After (get-date).AddDays(-1) > C:\Users\devin\Desktop\last_24.txt}
}

# Function that collects all events that have a type of Error and creates a file of errors.txt, if already exists, replaces with new file.
Function SaveErrorLogs
{
process {Get-EventLog -Logname System -EntryType Error > C:\Users\devin\Desktop\errors.txt}
}

# Function writes all events that have an EventId of the num1 variable to the screen
Function SearchId($num1)
{
process {Get-EventLog -Logname System | Where-Object {$_.EventID -eq $num1}}

}

# Function writes all of the most recent event logs to the screen, variable is how many to look for.
Function MostRecent($num2)
{
process {Get-EventLog -Logname System -Newest $num2 | Format-Table -AutoSize}

}

# main function calls the other functions and has predetermined values to show functionality.
Function main
{
SaveDayLogs

SaveErrorLogs

SearchId(16)

MostRecent(20)

MostRecent(500)
}

main