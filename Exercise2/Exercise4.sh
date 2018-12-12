#!/bin/bash

echo -n "Enter the process id to check the state: "
read process_id


state=`ps -e|grep $process_id |awk '{print $1 }'`
echo $state
if [ $state ]
then 
 echo "Process is currently running"
else 
 echo "Process is not currently running"
fi
