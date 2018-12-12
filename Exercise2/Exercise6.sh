#!/bin/bash
 
 
     field=()
       x=`echo $[ 1 + $[ RANDOM % 49 ]]`
       field[0]=$x
       
       echo "$x" >> Random_values.txt
       echo `date '+%Y-%m-%d %H:%M:%S'` >> Random_values.txt
 
   for (( i=1; i<5; i++ )); do 
       x2=`echo $[ 1 + $[ RANDOM % 49 ]]`
           
     for (( j=0; j<5; j++ )); do
      
       if [ $x2 == "${field[$j]}" ]
       then  
       x2=`echo $[ 1 + $[ RANDOM % 49 ]]`
        fi
     done 
         
         field[$i]=$x2 
       echo -e "\n" >> Random_values.txt
       echo "${field[$i]}" >> Random_values.txt
       echo `date '+%Y-%m-%d %H:%M:%S'` >> Random_values.txt
   done
 
    echo "System generates 5 random number"
    echo "Do u want to see those numbers"
    echo -n "Press [y/n] for action: "
    read option
    
    if [ $option == "y" ] 
      then  
      echo 
      echo "5 Random Values are : ${field[@]}"  ;   echo
      echo "These values are also stored to the file named 'Random_values.txt' "
   
      else 
      exit
    fi


