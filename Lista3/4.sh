#!/bin/bash
read -p "Informe o IP: " VAR
o1=$(echo $VAR | awk -F  "." '{print $1}')
o2=$(echo $VAR | awk -F  "." '{print $2}')
o3=$(echo $VAR | awk -F  "." '{print $3}')
o4=$(echo $VAR | awk -F  "." '{print $4}')

for i in {1..4}
do
v=o${i}
echo -n "Octeto #$i: ${!v} em binário "
echo "obase=2;$o1"|bc
done
