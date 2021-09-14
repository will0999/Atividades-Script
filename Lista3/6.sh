#!/bin/bash
read -sp "Informe a senha: " PASS
echo ""
if [ ${#PASS} -gt 7 ] && [ $(echo $PASS |grep -E "[a-z]") ] && [ $(echo $PASS|grep -E "[A-Z]") ] && [ $(echo $PASS |grep -E "[0-9]") ]
then
	echo "A senha está boa! ou seja tu não vai ser hackeado fácilmente mermão"
else
	echo "Senha muito fraca, vai ser hackeado jaja amigo!"
fi
