# Script: powershell_processes.ps1
# Author: Devin Iverson
# Date of latest revision: 03/08/22
# Purpose: Useful tools for use in powershell for future reference.

# Function that prints all active processes ordered by highest CPU time consumption at top
Function Sorted_CPU 
{
    Get-Process | Sort-Object CPU -desc
}

# Function that prints all active processes ordered by highest Process Identification Number at top
Function Sorted_Ids 
{
    
    Get-Process | Sort-Object Id -desc
}

# Function that prints the top five active processes, ordered by highest Working Set(WS(K)) at top
Function TopFiveWorkingSets
{

    Get-Process | Sort-Object -Property WS -desc | Select -First 5
}

# Opens Internet explorer and goes to website 
Function OwaspExplorer
{

    [system.Diagnostics.Process]:: Start("iexplore","https://owasp.org/www-project-top-ten/.")
}

# Opens as many Internet explorers to finish loop, and goes to the website on each one
Function LoopOwaspExplorer #($loops)
{

    for ($i;$i -lt 10;$i++) {
        [system.Diagnostics.Process]:: Start("iexplore","https://owasp.org/www-project-top-ten/.")
    }
}

# Closes out all Internet Explorer tabs running on the local machine
Function ExitAllExplorers 
{
    # audible alert to warn user that they are stopping a process
    for ($k = 0; $k -le 3; $k++){"`a"}

    Get-Process iexplore | Stop-Process -Force
}

# Closes out a process by its Process Identification Number 
Function KillById($eyed) 
{
    # audible alert to warn user that they are stopping a process
    for ($j = 0; $j -le 2; $j++){"`a"}

    stop-process -id $eyed -Force
}

# Main function to provide user experience and the ability to choose function to use
Function main 
{
    while ($val -ne 5)
    {
        $res = Read-Host "Main Menu `n Enter the number of function to run: `n 1.Sorted_CPU `n 2.Sorted_Ids `n 3.TopFiveWorkingSets `n 4.OwaspExplorer `n 5.TenOwaspExplorers `n 6.ExitAllExplorers `n 7.KillById `n 8.Exit `n Function #"
        

        if($res -eq 1)
        {
            $val++
            write-host("`n")
            Sorted_CPU
        }
        elseif($res -eq 2)
        {
            $val++
            write-host("`n")
            Sorted_Ids
        }
        elseif($res -eq 3)
        {
            $val++
            write-host("`n")
            TopFiveWorkingSets
        }
        elseif($res -eq 4)
        {
            $val++
            write-host("`n")
            OwaspExplorer
        }
        elseif($res -eq 5)
        {
            $val++
            write-host("`n")
            # $loops = Read-Host "How many tabs of OwaspExplorer would you like? "
            LoopOwaspExplorer #($loops)
            # Giving the computer time to run this function
            Start-Sleep -Seconds 5
        }
        elseif($res -eq 6)
        {
            $val++
            ExitAllExplorers
        }
        elseif($res -eq 7)
        {
            $val++
            write-host("`n")
            $eyed = Read-Host "ID of process to be killed: "
            KillById($eyed)
        }
        elseif($res -eq 8)
        {
            Break
        }
        else {
            $val++
            continue
        }
    }


}
main