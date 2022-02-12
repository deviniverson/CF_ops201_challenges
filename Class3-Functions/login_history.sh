#!bin/bash

# Script Name: login_history.sh
# Description of purpose: collect login history and log in history_out.txt
# Example usage: collecting logins from a computer
# Expected output: devinive pts/1 192.168.0.177 Fri Feb 11 05:23 
# Declaration of variables (if any): num
# Declaration of functions (if any): login_lookup

# Main
# User asked how many logins wanted
echo "How many recent logins do you want to see?"
read num
# function to look up logins
login_lookup() {
    echo $(last -n "$num")
}
# directing info to log file
login_lookup >> history_output.txt
# End