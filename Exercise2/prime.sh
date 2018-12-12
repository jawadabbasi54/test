#!/bin/bash

 count=0
 i=0
 j=0
      
        echo "Enter starting number : ";
	read start;
      
	echo "Enter ending number : ";
	read end;
	echo -e "Prime Number Between $start and $end is :\n"
	
	
for (( i=$start; i<=$end; i++))
do 
    sqrt=$(bc <<< "scale=1; sqrt(($i))")
   round_off=`printf "%.0f" $(echo "scale=2;$sqrt" | bc)`

   count=0

 if [ $round_off == 1 ]
  then 
  let count=$count+1
  fi

for(( j=1; j<$round_off; j++ ))
 do 
 
for(( k=2; k<$j; k++ ))
 do 
 
  if [ `expr $round_off % $k` == 0 ] 
  then
   let count=$count+1
   break
  fi 
 done 

 if [ $count == 0 ]
  then 
  printf "$round_off\n"
  count=0
  fi 


 done

  
 

done





