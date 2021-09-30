#!/bin/bash

. functions.sh

read -p "Informe o link: " link
echo "============= Começando o download em... ============="
sleep 1 && echo "3..."
sleep 1 && echo "2..."
sleep 1 && echo "1..."
sleep 1

#utilizando parametro -O no wget para redicionar a página para um arquivo
wget -O /tmp/site.html $link
sleep 1
clear

#utilizando parametro -e no echo para visualizar a formatação de cores, e fazer a concatenação de operadores de barra invertida
echo -e "\e[01;32m[!] Sucesso! Site Baixado. [!]\e[00m\n"

while true; do
    #clear
    echo "============= Websites Manipulator ============="
    echo -e "Site atual ~> \e[00;32m$link\e[00m"
    echo ""
    echo "A) --> Exibir Links"
    echo "B) --> Acessar Link"
    echo "C) --> Exibir a lista de imagens"
    echo "D) --> Baixar a imagem"
    echo "E) --> Exibir página"
    echo "F) --> Limpar tela "
    echo "Q) --> Sair"
    echo ""
    read -p "Informe a opção> " opcao
    case $opcao in
    "A") clear && show_links;;
    "B") clear && access_link ;;
    "C") clear && list_images ;;
    "D") clear && download_image ;;
    "E") clear && show_page ;;
    "F") clear;;
    "Q") echo -e "\e[01;36m[!] Programa Encerrado [!]\e[00m" &&break ;;
    *) echo -e "\e[00;31m[!] Opa, Você digitou um indice errado!\nInforme um índice da mesma forma que está no menu.[!]\e[00m" && sleep 3;;
    esac
done
