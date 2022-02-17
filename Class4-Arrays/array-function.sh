#!bin/bash

# Script Name: array-function.sh
# Description of purpose: make four directories, combine all of them into an array then put a .txt file in each directory
# Example usage: 
# Example output: four directories, each with their own newfile.txt
# Declaration of variables (if any): dirs
# Declaration of functions (if any): none, could if I wanted to ask for user input on how many directories to create.

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

# for loop to create a new file in each directory, "@" means all
for d in ${dirs[@]}
do
    # move into the disired directory
    cd $d
    # create file
    touch newfile.txt
    # step back to starting point
    cd ..
done

# End