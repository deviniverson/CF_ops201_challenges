#!bin/bash

# Script Name: loop-assignment.sh
# Description of purpose: terminating process
# Example usage: terminating processes disired by user
# Example output: 
# Declaration of variables (if any): input and i
# Declaration of functions (if any): none

# Main
# print all active processes
ps aux
x=1
# Menu
menu(){
    # infinite while loop menu
    while [ $x == 1 ]
    do    
        read -p "Menu: Enter 1 to terminate processes, Enter 0 to exit application " user 
        
        if [ $user == 1 ]
        then
            terminate-PID
        
        elif [ $user == 0 ]
        then    
            break

        else
            continue
        fi
    done

}


# function to terminate process with PID
terminate-PID(){
    # user input, which process IDs to terminate
    read -p "Enter PID # for process to be terminated, if more than one separate with a space (Enter 0 to end script) : " input

    # if statement to end script if 0 submitted
    if [ $input == 0 ]
    then
        break
    fi

    # for loop to terminate each PID inputed
    for i in ${input[@]}
    do
        kill $i
        # user informed that PID was terminated
        echo "PID # $i has been terminated"
    done
}

# function called
menu
echo "Script Ended"

# End