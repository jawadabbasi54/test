#!/bin/bash


cd /home/$USER
modified_path=`find . -not -path '*/\.*' -mmin -1440 -type f`
tar -czvf tarball.tar.gz $modified_path

