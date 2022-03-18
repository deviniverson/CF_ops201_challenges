# Script Name: ip_collector.ps1
# Devin Iverson
# 3/17/22
# Name of Function: main
# Name of Variables: Line, ipv4

Function main
{
    # system opens ipconfig /all, it finds rows with "IPv4" and returns them as strings to $Line
    $Line = ipconfig /all | Select-String -Pattern "IPv4" | Out-String

    # assign ipv4 the IP address that matches the pattern shown below
    $ipv4 = ($Line | Select-String -Pattern "\d{1,3}(\.\d{1,3}){3}" -AllMatches).Matches.Value

    # Print out ipv4
    Write-Output $ipv4 

    # Stretch Goal: I used pipes to hold the data in memory instead of sending it off to a txt file.

    # Stretch Goal:
    # Testing IPv4 connection to the internet
    Test-Connection -TargetName www.codefellows.org -IPv4
}

main