#!/bin/bash

file=`basename "$0"`

echo "Echo Reversed Lines of file itself"
tac $file | while read line; do
  echo $line
done



