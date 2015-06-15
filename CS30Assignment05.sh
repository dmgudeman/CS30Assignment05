# ###########################################
# 
# Program: CS30Assignment05
# Purpose: Takes in a command or user name
#          outputs, confirmation email, 
#          command result or error message
#
# Author: David Gudeman
# Date: June 14, 2015
# ##########################################

#!/bin/bash
set -o xtrace
echo "Please enter your username or a command:"

read userEntry
firstArg=${userEntry%% *}

echo $1 "=echo"

if hash $firstArg; then
  $userEntry

# check to see if input is the username
# parameter: $userEnrtry, the user's input
# returns: email to user, command output or error
elif [[ $userEntry == $USER ]]; then #if so send email to user
   echo "$(last $USER | head -1 | cut -c 40-58)" | mail -s "I'm watching you" $userEntry"@"$HOSTNAME
   echo "david1" $logTime
else 

echo "You did not enter a username or a viable command,
check to make sure you have permission" 
fi
