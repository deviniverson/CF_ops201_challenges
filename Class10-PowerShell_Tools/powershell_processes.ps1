# Script: powershell_processes.ps1
# Author: Devin Iverson
# Date of latest revision: 03/08/22
# Purpose: Useful tools for use in powershell for future reference.

# Function that prints all active processes ordered by highest CPU time comsuption at top
Function ordered_cpu 
{
    Get-Process | Sort-Object CPU -desc
}

# Function that prints all active processes ordered by highest Process Identification Number at top
Function Sorted-Ids 
{
    # 
    Get-Process | Sort-Object Id -desc
}

# Function that prints the top five active processes, ordered by highest Working Set(WS(K)) at top
Function TopFiveWorkingSets
{

    Get-Process | Sort-Object -Property WS | Select -Object -Last 5
}

# Opens Internet explorer and goes to website 
Function OwaspExplorer
{

    [system.Diagnostics.Process]:: Start("iexplore","https://owasp.org/www-project-top-ten/.")
}

# Opens as many Internet explorers to finish loop, and goes to the website on each one
Function LoopOwaspExplorer($loops)
{

    for ($i;$i -lt $loops;$i++) {
        [system.Diagnostics.Process]:: Start("iexplore","https://owasp.org/www-project-top-ten/.")
    }
}

# Closes out all Internet Explorer tabs running on the local machine
Function ExitAllExplorers 
{

    Get-Process iexplore | Stop-Process -Confirm -PassThru
}

# Closes out a process by its Process Identification Number 
Function KillById($id) 
{

    Stop-Process -Id $id -Confirm -PassThru
}