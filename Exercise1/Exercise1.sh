#!/bin/bash

src=`basename "$0"`
echo "                    Exercise No.1            "
echo 
echo

echo -n "Enter target file name : "
read targ
 
if [ ! -e $src ]
then
 echo "File $src does not exists"
 exit 1
elif [ -f $targ ]
then
 echo "File $targ exist, cannot overwrite"
 exit 2
fi
 
# copy file 
cp `pwd`/$src `pwd`/$targ
 
# store exit status of above cp command. It is use to 
# determine  if shell command operations is successful or not
status=$?
 
if [ $status -eq 0 ]
then
 echo 'File copied successfully'
else
 echo 'Problem copying file'
fi
