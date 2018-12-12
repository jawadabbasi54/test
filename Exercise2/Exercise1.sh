#!/bin/bash
  

 counter=1
function Decompress_File(){
  echo 
  file_name=""
  file_extension=""
  file_type=""
  echo -n "Enter file name # $counter:"
  read file_name  
  file_extension=${file_name#*.}
  echo
  echo "File Name: $file_name"
  echo "File Extension: $file_extension"
  
  case $file_extension in 
  zip)
     echo "File extension is in zip form"
     unzip $file_name
   ;;
 
  tar)
     echo "File extension is in tar form"
     tar xvf $file_name
   ;;

  gz)
     echo "File extension is in gzip form"
     gunzip $file_name
   ;;

  bz2)
     echo "File extension is in bzip2 form"
     bunzip2 $file_name
   ;;

 tar.bz2)
     echo "File extension is in bzip2 form"
     tar xvjf $file_name
   ;;

  *)
     echo "Unknown file extension/ File not Compressed"
  esac

  let counter=$counter+1
}


#Function calling
Decompress_File

 echo "Do u want to decompress another file ?"
   echo -n "Press [y/n] for action:"
   read option
   
while [[ $option == "y" ]]
do
  if [ $option == "n" ]
  then 
  exit 0 
  fi
#Function calling
   Decompress_File
 echo "Do u want to enter another file ?"
   echo -n "Press [y/n] for action:"
   read option 
done





