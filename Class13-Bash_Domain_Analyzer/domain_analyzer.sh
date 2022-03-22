#!bin/bash

# Script Name: domain_analyzer.sh
# Description of purpose: automate the process of getting information on a domain.
# Example usage: google.com entered, information about the domain of google.com in the DomainFile.txt file.
# Expected output: information about the domain entered in a text file
# Declaration of variables (if any): input
# Declaration of functions (if any): domain-info, main

# Main
domain-info(){
    #
    whois $input
    spacer

    dig $input
    spacer

    host $input
    spacer 

    nslookup $input | head -n 2
}
spacer(){
    echo " "
    echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    echo " "
}



read -p "Enter Domain to get information on: " input

domain-info > DomainFile.txt

# End