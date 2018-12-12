#!/bin/bash

echo "                      Exercise 3     "
echo 

#Through While Loop 
echo "By While Command:"
i=0
Planets=("Mercury" "Venus" "Earth" "Mars" "Jupiter" "Saturn" "Uranus" "Neptune" "Pluto")
arr_length=${#Planets[@]}
echo $arr_length
 while (( $i < $arr_length ))
do
    echo "${Planets[$i]}"
    i=`expr $i+1`
done
echo; echo

#Through Until Loop 
echo "By Until Loop:"
i=0
 until (( $arr_length < $i ))
do
    echo "${Planets[$i]}"
    i=`expr $i+1`
done

echo; echo





for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
    # All planets on same line.
    # Entire 'list' enclosed in quotes creates a single variable.
    # Why? Whitespace incorporated into the variable.
do
  echo $planet
done
echo; echo "Whoops! Pluto is no longer a planet!"

#Answer: Because within the double qoutes this script will treat will as a single value which is being assign to the `planet` variable


exit 0
