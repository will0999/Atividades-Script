#!/bin/bash

function funcA {
        c=$(awk '{gsub("[a-zA-Z]",""); print $1}' $1)
        echo "$c" > $1
}

function funcB {
        c=$(sed 's/[0-9]*//g' < $1)
        echo "$c" > $1
}

function funcC {
        c=$(awk '{gsub("[^a-zA-Z0-9]","~"); print $1}' $1)
        echo "$c" > $1
}

function menu {

        echo -e "\nR) ---> Para Digitar o nome do arquivo\nA) ---> Para Remover todas as letras do arquivo\nB) ---> Para Remover todos os digitos do arquivo\nC) ---> Para Substituir todos os caracteres que não são letras nem dígitos do arquivo por ~\nQ) ---> Para Sair"
	read -p "Digite a letra da opção desejada(minuscula): " opcao
        if [ $opcao == "r" ]
        then
                read -p "Digite o nome do arquivo: " arquivo
        fi

        if [ $opcao == "a" ]
        then
                if [ -z $arquivo ]
		then
			echo "Não existe ou não foi digitado nenhum arquivo."
			menu
		else
			funcA $arquivo
			cat $arquivo
 	       	fi
	fi

        if [ $opcao == "b" ]
        then
                if [ -z $arquivo ]
                then
                        echo "Não existe ou não foi digitado nenhum arquivo."
                        menu
                else
                        funcB $arquivo
                        cat $arquivo
                fi

        fi

        if [ $opcao == "c" ]
        then
                if [ -z $arquivo ]
                then
                        echo "Não existe ou não foi digitado nenhum arquivo."
                        menu
                else
                        funcC $arquivo
                        cat $arquivo
                fi

        fi

        if [ $opcao == "q" ]
        then
                exit
        fi

}


while true
do

menu

done
