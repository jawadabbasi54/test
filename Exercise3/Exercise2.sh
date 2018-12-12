#! /bin/bash

: "
You don't need an atoi equivalent, Bash variables are untyped.
In bash, variables are treated as integer or string depending on context.
 Trying to use variables set to random characters in arithmetic will just silently ignore them
"

echo -n "1 argument in Integer:"
echo $1
echo -n "2nd argument in String:"
echo $2
let res=$1+$2
echo 
echo -n "Result:"
echo $res




#Function Definition
function itoi()
{
echo -n "ASCII value :"
read int_no
echo  -n "ASCII value of '$int_no' is: "
printf "%d" \'$int_no

}


echo 
echo


#Function Calling
itoi 

echo









