#!/bin/bash

# This script will detect the node helth of the machine.

#################################################G
# Author: Anurag-xo
# Date: 01/01/2025
#
# This script outputs the node health
#
#Version: v1
################################################
set -x # debug mode
# Best pratices while using pipe
set -e              # exits the script when there is an error
set -o pipefail     # the set -e will not catch any pipefailures to overcome errors like this "ldkfjfalkjdf | echo" we use this.
# OR
#set -exo pipefail      # to use all the abve three command on a single line

df -h

free -h

nproc

ps -ef    #(procide entire detials of the process in an extended format)

ps -ef | grep "systemd" | awk -F " " '{ print $2 }'   # to get the proceses in which "systemc" is running and its only number using awk


echo "Hopefully the script works fine now"
