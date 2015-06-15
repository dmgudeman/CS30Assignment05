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

echo "Please enter your username or a command:"

read userEntry	# store user input in $userEntry

	  	# extract the first word to test if it is a command
firstArg=${userEntry%% *} 

if hash $firstArg 2>/dev/null; then # hash tests if command
  $userEntry	# command is executed

  		# check to see if input is the username
elif [[ $userEntry == $USER ]]; then #if so send email to user

		# last returns last login data, head -1 limits to one
	       	# line and cut -c extracts the date and time
		# mail emails to the user, -s is the subject
   echo "$(last $USER | head -1 | cut -c 40-58)" \
	   | mail -s "I'm watching you" $userEntry"@"$HOSTNAME

		# if no conditions met, falls through to an error message    
else 
echo "You did not enter a username or a viable command,
check to make sure you have permission" 
fi
