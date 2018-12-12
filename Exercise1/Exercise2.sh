#!/bin/bash


echo 


echo "              Exercise 2          "
ls -R $HOME > `pwd`/Information143.txt

tar cvf Information_compress143.tar Information143.txt
echo "Kindly Enter the USB to copy the Home Directory Files Tree"
echo -n "R u willing to insert usb, Press [y/n] for action?"
read option

if [ $option == "y" ]
then
echo "Yes ofcourse"




usb_path=`df -h|grep /dev/sdb |awk '{print $1 }'`
mount_path=`df -h|grep /dev/sdb |awk '{print $6 }'`
sudo umount $mount_path
sudo mount $usb_path /media/$USER

sudo cp `pwd`/Information_compress143.tar /media/$USER
echo "File Moved to USB Successfuly"

echo "Do u want to unmount the USB drive? "
echo -n "Press [y/n] for action?"
read action

if [ $action == "y" ]
then
mount_path1=`df -h|grep /dev/sdb |awk '{print $6 }'`
sudo umount $mount_path1

else 
echo "To unmount the usb device is mandatory"
fi 

else
  echo "NO, I m not"
fi







