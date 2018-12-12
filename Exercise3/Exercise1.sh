#! /bin/bash

#Function Definition
function check_type()
{ 


  if [ `echo $1 | grep "^~\?[0-9]*$"` ] 
  then
  echo "'$1' is a number" 
 
 
  else
  echo "'$*' is a string" 
 
  fi

}

echo -n "Kindly pass some argument to check: "
read arg

#Function Calling
check_type "$arg"

: ' `expr $1 + 0`
 This  above expression will give a warning message: "non-integer argument" because a keyword named "expr" will expect only the integer values to calculte some expression. 
'
