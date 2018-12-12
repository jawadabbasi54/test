#! /bin/bash

arr=()

cd /home/$USER
for i in `find . -not -path '*/\.*' -type f -size +100k`
do
arr+=($i)
done

printf '%s\n' "${arr[@]}"
echo
echo "Do u want to delete/compress these file ? "
echo -n "Press [y/n] for action: "
read option

if [ $option == "y" ]
then 
count=0
arr_size=${#arr[@]}
while (( $count < $arr_size ))
do 
 
 echo; echo
 echo "File no." $(($count+1))

 file_path=${arr[$count]}
 file_name=${file_path##*/}
 fname=${file_name%%.*}
 fpath=$(dirname "$file_path")
 
 echo "File Path: "$file_path
 echo "File Name: "$file_name 
 

 echo
 echo "Do u want to delete this above file ? "
 echo -n "Press [y/n] for action: "
 read option1 
if [ $option1 == "y" ]
then 
 rm -r $file_path
 echo "File Deleted Successfully"
 echo $file_name >> $fpath/Logfile.txt
 echo `date '+%Y-%m-%d %H:%M:%S'` >> $fpath/Logfile.txt
 else 
 echo "File not Delete"
fi

echo
echo "Do u want to compress this above file ? "
 echo -n "Press [y/n] for action: "
 read option2

if [ $option2 == "y" ]
then 
 zip $fpath/$fname.zip $file_path
 echo "File Compressed Successfully"
else 
 echo "File not Compress"
fi

 let count=$count+1
done 

else
  echo "Ok. No Problem..!"
fi





