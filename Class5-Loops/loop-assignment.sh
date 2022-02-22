#!bin/bash

# Script Name: loop-assignment.sh
# Description of purpose: terminating process
# Example usage: terminating processes disired by user
# Example output: 
# Declaration of variables (if any): input and i
# Declaration of functions (if any): none

# Main
# print all active processes
echo ps aux

# user input, which process IDs to terminate
read -p "Enter PID # for process to be terminated, if more than one seporate with a space :" input

# for loop to terminate each PID inputed
for i in ${input[@]}
do
    kill $i
    # user informed that PID was terminated
    echo "PID # $i has been terminated"
done
echo "Script has finished."
# End