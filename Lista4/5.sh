#!/bin/bash

while IFS= read -r line
do
  var=$(echo $line|cut -d' ' -f1)
  var1=$(echo "(${var:0:2}) ${var:2:1} ${var:3:4}-${var:7:4}")
  echo $var1
done < "$1"
