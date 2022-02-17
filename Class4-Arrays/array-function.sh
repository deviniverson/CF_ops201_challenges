#!bin/bash

# Script Name: array-function.sh
# Description of purpose: 
# Example usage: 
# Example output: 
# Declaration of variables (if any): 
# Declaration of functions (if any): 

# Main
# make each directory
mkdir dir1
mkdir dir2
mkdir dir3
mkdir dir4

# combine the directories into an array 
dirs=(dir1 dir2 dir3 dir4)

# test: print name of all directories in array
echo ${dirs[*]}

# for loop to create a new file in each directory
for d in ${dirs[@]}
do
    cd $d
    touch newfile.txt
    cd ..
done

# End