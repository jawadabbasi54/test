#!/bin/bash

unique=`md5sum /etc/passwd`
echo -n "Your Unique id is: " 
echo ${unique:0:6}
