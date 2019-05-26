#!/bin/bash
#Change files by its first line of content
    #1- Lists the files of the current directory and gets its name* in a loop.
    #2- The head -n 1 command shows the first line of content of a file. So, we save this line into a variable.
    #3- Finally, we rename the files.
#*By default, the shell splits the output of a command (ls, for example) on spaces, tabs, and newlines. In order to get filenames with spaces, we have to set the IFS variable to just split with '\n' character.

OIFS="$IFS"
IFS=$'\n'

for NAME in $(ls *) 
do
	NEW_FILENAME=$(head -n 1 $NAME)
	mv $NAME $NEW_FILENAME 
done

#Setting the value of IFS to the old one.
IFS="$OIFS" 
