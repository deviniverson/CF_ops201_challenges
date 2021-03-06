#!bin/bash

# Script Name: file-dir-checker.sh
# Description of purpose: creates file or directory if the name is unique
# Example usage: 
# Example output: 
# Declaration of variables (if any): file, input_arr, dir, file_answer, dir_answer, user_choice
# Declaration of functions (if any): menu, create_dir, create_file, check_dir, check_file

# Main
# array of all attempted file or directory names
input_arr=()

# function to check if file exists
check_file(){
    
    if [[ -f $file ]]
    then
        echo "$file already exists"   
    
    else
        create_file
    fi
}

# function to check if directory exists
check_dir(){

    if [[ -d $dir ]]
    then
        echo "$dir already exists"   
    
    else
        create_dir
    fi

}
# function to prompt user to confirm that they want to create a file and to create it
create_file(){

    read -p "Create a new file with the name of $file in the current directory? (y for yes, n for no, e to exit) " file_answer 
    
    if [ $file_answer == y ] || [ $file_answer == Y ]
    then
        touch $file
        echo "$file created"
    
    
    elif [ $file_answer == e ] || [ $file_answer == E ]
    then
        break
    
    else
        continue
    fi
}
# function to prompt user to confirm that they want to create a new directory and to create it
create_dir(){
    read -p "Create a new directory with the name of $dir in the current directory? (y for yes, n for no, e to exit) " dir_answer 
    
    if [ $dir_answer == y ] || [ $dir_answer == Y ]
    then
        mkdir $dir
        echo "$dir created"
    
    
    elif [ $dir_answer == e ] || [ $dir_answer == E ]
    then
        break
    
    else
        continue
    fi

}
# menu function
menu(){
    while [ : ]
    do
        read -p "Create a new file or directory? (f for file, d for directory, e to exit) " user_choice
        
        if [ $user_choice == f ] || [ $user_choice == F ]
        then
            read -p "Name your new file? (name must be unique from other files of your filesystem) " file
            input_arr+=($file)
            
            check_file
        
        elif [ $user_choice == d ] || [ $user_choice == D ]
        then
            read -p "Name your new directory? (name must be unique from other directories of you filesystem) " dir
            input_arr+=($dir)
            
            check_dir
        
        elif [ $user_choice == e ] || [ $user_choice == E ]
        then
            break
        
        else
            continue
        fi

    done

}

menu

# End