#!/bin/bash

# Script: systeminfo.sh                  
# Author: Devin Iverson         
# Date of latest revision: 02/27/22     
# Purpose: Use lshw command and trim down only the information that was needed

# Main

# Topic Arrays
cpu_arr=( $(lshw | grep -A 5 '*-cpu') )
ram_arr=( $(lshw | grep -A 3 '*-memory') )
display_arr=( $(lshw | grep -A 11 '*-display') )
network_arr=( $(lshw | grep -A 15 '*-network') )

# main fuction to run all other fuctions
main(){
    comp_function
    cpu_function
    ram_function
    display_function
    network_function
    echo " "
    echo "End Transmission"
    echo " "
}

# displays computer name
comp_function(){
    compName=$(lshw | grep -i -m1 "")

    # print Computer name
    echo " "
    echo "Computer Name: $compName"
    echo " "
}

# display all information for CPU
cpu_function(){
    cpu_product="${cpu_arr[@]:2:6}"
    cpu_vendor="${cpu_arr[@]:9:2}"
    cpu_physicalID="${cpu_arr[13]}"
    cpu_busInfo="${cpu_arr[16]}"
    cpu_width="${cpu_arr[@]:18:2}"

    # provide user with readable information
    echo "CPU"
    echo "  Product: $cpu_product"
    echo "  Vendor: $cpu_vendor"
    echo "  Physical ID: $cpu_physicalID"
    echo "  Bus Info: $cpu_busInfo"
    echo "  Width: $cpu_width"
    echo " "

}

# display all information for RAM
ram_function(){
    ram_description="${ram_arr[@]:2:2}"
    ram_physicalID="${ram_arr[6]}"
    ram_size="${ram_arr[8]}"

    # provide user with readable information
    echo "RAM"
    echo "  Description: $ram_description"
    echo "  Physical ID: $ram_physicalID"
    echo "  Size: $ram_size"
    echo " "
}

# display all information for Display Adapter
display_function(){
    display_description="${display_arr[@]:2:3}"
    display_product="${display_arr[@]:6:3}"
    display_vender="${display_arr[10]}"
    display_physicalID="${display_arr[13]}"
    display_busInfo="${display_arr[16]}"
    display_width="${display_arr[@]:20:2}"
    display_clock="${display_arr[23]}"
    display_capabilities="${display_arr[@]:25:3}"
    display_configuration="${display_arr[@]:29:2}"
    display_resources="${display_arr[@]:32:5}"

    # provide user with readable information
    echo "Display Adapter"
    echo "  Description: $display_description"
    echo "  Product: $display_product"
    echo "  Vender: $display_vender"
    echo "  Physical ID: $display_physicalID"
    echo "  Bus Info: $display_busInfo"
    echo "  Width: $display_width"
    echo "  Clock: $display_clock"
    echo "  Capabilities: $display_capabilities"
    echo "  Resources: $display_resources"
    echo " "

}

# display all information for Network Adapter
network_function(){
    network_description="${network_arr[@]:2:2}"
    network_product="${network_arr[@]:5:4}"
    network_vendor="${network_arr[@]:10:3}"
    network_physicalID="${network_arr[14]}"
    network_busInfo="${network_arr[17]}"
    network_logicalName="${network_arr[20]}"
    network_version="${network_arr[22]}"
    network_serial="${network_arr[24]}"
    network_size="${network_arr[26]}"
    network_capacity="${network_arr[28]}"
    network_width="${network_arr[@]:30:2}"
    network_clock="${network_arr[33]}"
    network_capabilities="${network_arr[@]:35:13}"
    network_configuration="${network_arr[@]:49:13}"
    network_resources="${network_arr[@]:63:3}"

    # provide user with readable information
    echo "Network Adapter"
    echo "  Description: $network_description"
    echo "  Product: $network_product"
    echo "  Vender: $network_vendor"
    echo "  Physical ID: $network_physicalID"
    echo "  Bus Info: $network_busInfo"
    echo "  Logical Name: $network_logicalName"
    echo "  Version: $network_version"
    echo "  Serial: $network_serial"
    echo "  Size: $network_size"
    echo "  Capacity: $network_capacity"
    echo "  Width: $network_width"
    echo "  Clock: $network_clock"
    echo "  Capabilities: $network_capabilities"
    echo "  Configuration: $network_configuration"
    echo "  Resources: $network_resources"

}

main

# End