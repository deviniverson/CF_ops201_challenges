#!/bin/bash

# Script: systeminfo.sh                  
# Author: Devin Iverson         
# Date of latest revision: 02/26/22     
# Purpose:                      

# Declaration of variables

# Main
# Search the output of lshw command and returns every line with the word bridge in it
lshw | grep “bridge” 