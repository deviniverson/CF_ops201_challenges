#!bin/bash

# Script Name: ping_output.sh
# Description of purpose: ping_output checks ping from Ubuntu server to Google.com three times then sends to output.txt for storage
# Example usage: checking ping at different times of the day
# Expected output: Three ping attempts sent to be logged
# Declaration of variables (if any): ping_output
# Declaration of functions (if any):

# Main

# Variable declaration
config_info=$(ifconfig)
echo $config_info
# Sending ping_output sent to output.txt, with ">>" each interation is appended to previous file
echo "$config_info" >> config_output.txt


# End