

read -p "digite o nome do arquivo 1: " q1

ls $q1 2>/dev/null 1>/dev/null
if [ $? -eq 2 ]
then
	echo "erro: o arquivo $q1 não existe"
	exit
fi

read -p "digite o nome do arquivo 1: " q2

ls $q2 2>/dev/null 1>/dev/null
if [ $? -eq 2 ]
then
	echo "erro: o arquivo $q2 não existe"
	exit
fi

a=$(wc -l < $q1)
b=$(wc -l < $q2)

if [ $a -gt $b ]
then
	echo $q1
else
	echo $q2
fi

