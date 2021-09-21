#! /bin/bash
function maior {
a=$(cat $1)
count=0
for v in ${a[@]}; do
    if (( $v > $count )); then count=$v; fi; 
done
echo "o maior numero é: $count"
}

function menor {
a=$(cat $1)
count1=$(head -n 1 $1|awk '{print $1}')
for v in ${a[@]}; do
    if (( $v < $count1 )); then count1=$v; fi;
done
echo "O menor numero é: $count1"
}
maior $1
menor $1
