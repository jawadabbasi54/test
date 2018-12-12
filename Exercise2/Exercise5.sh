#!/bin/bash

 count=0
 i=0
 j=0
       # a=$(bc <<< "scale=0; sqrt((430))")
       # echo $a
        echo "Enter starting number : ";
	read start;
	echo "Enter ending number : ";
	read end;
	echo -e "Prime Number Between $start and $end is :\n"
	
	
for (( i=$start; i<=$end; i++))
do 
 count=0

 if [ $i == 1 ]
  then 
  let count=$count+1
  fi

 for(( j=2; j<$i; j++))
 do 
  if [ `expr $i % $j` == 0 ] 
  then
   let count=$count+1
   break
  fi 
 
 done
  
  if [ $count == 0 ]
  then 
  printf "$i\n"
  fi 

done





