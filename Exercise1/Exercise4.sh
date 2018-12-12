#!/bin/bash

echo "                      Exercise 4     "
echo



field=()
bold=$(tput bold)
normal=$(tput sgr0)


echo "Enter the target file name : "
read target

space="                                  "
echo -e "$space ${bold}Effect of double spacing ${normal} "
 i=0

while read line; do
   
    field+=("$line")
  
    echo -e "\n${field[$i]}"
    let i=$i+1 
    done < "$target"
 
#For double spacing
  len=${#field[@]}
  i1=0
 cp /dev/null $target
 while (( $i1 < $len ))
 do
 echo -e "${field[$i1]}" >> $target
 echo -e "\n" >> $target 
 let i1=$i1+1 
done


echo 
echo

echo -e "\nDo you want to check all the neccessary conditions regarding $target file?"
echo -n "Press [y/n] for action ?"
read option


if [ $option == "y" ]
then

if [ ! -e $target ]
then
 echo "File $target does not exists"
 exit 0

elif [ ! -f $target ]
then
 echo "$target is not regular file"
 exit 1
fi

else 
echo "Ok, U dont want to check the file conditions"
exit 2
fi

echo


echo -e "\n"


#For triple spacing
 i2=0
 cp /dev/null $target
 while (( $i2 < $len ))
 do
 echo -e "${field[$i2]}" >> $target
 echo -e "\n\n" >> $target 
 let i2=$i2+1
 done

echo -e "${bold}Now File has a triple spacing effect${normal}"
 echo
 echo "Do you want to remove all spaces b/w lines?" 
 echo -n "Press [y/n] for action ? "
 read  option1 
if [ $option1 == "y" ]
 then

#For remove spacing
  i3=0
 cp /dev/null $target
 while (( $i3 < $len ))
 do
 echo -e "${field[$i3]}" >> $target
 let i3=$i3+1
 done
 echo "Now all line spacing was removed from the file."

else 
echo "Ok, you dont want to remove spaces"

fi




