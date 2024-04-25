#!/bin/bash

# Split the command input into an array by space
IFS=' ' read -r -a cmd_array <<< "$1"

# Execute sqitch with the array
/bin/sqitch "${cmd_array[@]}" --chdir "$2" --target "$3"
