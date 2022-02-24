#!bin/bash

# Script Name: file-dir-checker.sh
# Description of purpose: creates file or directory if the name is unique
# Example usage: 
# Example output: 
# Declaration of variables (if any): file, input_arr, dir, file_answer, dir_answer, file-dir
# Declaration of functions (if any): menu, create_dir, create_file, check_dir, check_file

# Main
# array of all attempts tried
input_arr=()
input_counter=0
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

    read -p "Do you want to create a new file with the name of $file in the current directory? (y for yes, n for no, e to exit) " file_answer 
    
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
    read -p "Do you want to create a new directory with the name of $dir in the current directory? (y for yes, n for no, e to exit) " dir_answer 
    
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
    while [ $input_counter -le 5 ]
    do
        read -p "Do you want to create a new file or directory? (f for file, d for directory, e to exit) " file-dir
        
        if [ $file-dir == f ] || [ $file-dir == F ]
        then
            read -p "What would you like to name your new file? (name must be unique from other files of your filesystem) " file
            input_arr+=($file)
            ((input_counter++))
            check_file
        
        elif [ $file-dir == d ] || [ $file-dir == D ]
        then
            read -p "What would you like to name your new directory? (name must be unique from other directories of you filesystem) " dir
            input_arr+=($dir)
            ((input_counter++))
            check_dir
        
        elif [ $file-dir == e ] || [ $file-dir == E ]
        then
            break
        
        else
            continue
        fi

    done

}

menu

# End