#!/bin/bash
l=$(sort down|awk '{print $1}' | uniq -c |wc -l)
nomes=$(sort $1|awk '{print $1}' | uniq -c|awk '{print $2}')
for (( c=1; c<=$l; c++ ))
do
	cont=0
	nome=$(echo $nomes |cut -d' ' -f"$c")
	var=$(cat $1 |grep $n|cut -d' ' -f3)
	for i in ${var[@]}; do
  		let cont+=$i
	done
	echo "$nome $cont"
done