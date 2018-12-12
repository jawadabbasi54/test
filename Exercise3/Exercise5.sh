#!/bin/bash

char_arr=()
alphabet=()



function banner()
{
case $1 in 
 "A"|'a') print 1 7 ;; 
 'B'|'b') print 8 14 ;;
 'C'|'c') print 15 21;;
 'D'|'d') print 22 28 ;;
'E'|'e')  print 29 35 ;;
'F'|'f')  print 36 42 ;;
'G'|'g')  print 43 49  ;;
'H'|'h') print 50 56  ;;
'I'|'i')  print 57 63  ;;
'J'|'j')  print 64 70  ;;
'K'|'k')  print 71 77  ;;
'L'|'l')   print 78 84  ;;
'M'|'m')  print 85 91   ;;
'N'|'n')  print 92 98   ;;
'O'|'o')   print 99 105   ;;
'P'|'p')   print 106 112  ;;
'Q'|'q')   print 113 119  ;;
'R'|'r')  print 120 126  ;;
'S'|'s') print 127 133 ;;
'T'|'t') print 134 140 ;;
'U'|'u') print 141 147 ;;
'V'|'v') print 148 154 ;;
'W'|'w') print 155 161 ;;
'X'|'x') print 162 168 ;;
'Y'|'y') print 169 175 ;;
'Z'|'z') print 176 182 ;;

  esac


}


function print()
{
 counter=$1
 while (( $counter <= $2 ))
 do 
 sed "${counter}q;d" "Alphabet.txt"
 let counter=$counter+1
  done 

}


echo -n "Kindly Enter the text:"
read string
len=${#string}
i=0
while (( $i < $len ))
do 
 char=${string:$i:1}
 char_arr+=($char)
 banner ${char_arr[$i]}
 let i=$i+1
done







