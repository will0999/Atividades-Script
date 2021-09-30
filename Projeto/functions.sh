#!/bin/bash

function show_links {
  rm /tmp/links.txt /tmp/links_formated.txt &>/dev/null
  echo -e "\e[00;35m============= Listando os links =============\e[00m"
  sed -n 's/.*href="\([^"]*\).*/\1/p' /tmp/site.html  > /tmp/links.txt
  # contador de linhas para acessar os links por indice
  contador=0
  while read -r linha_start
  do 
    let contador=contador+1
    linha=$(sed -n ${contador}p /tmp/links.txt)
    if [ $(echo $linha |grep -Eo '^.') == '/' ];
    then 
      echo " $link$linha" >> /tmp/links_formated.txt
    else 
      echo $linha >> /tmp/links_formated.txt
    fi
    if [ $(echo $linha |grep -Eo '^.') == '' ];
    then
      echo -e "\e[00;31m[!] Não há links a partir desse para acessar [!]\e[00m"
      sleep 3
      break
    fi
  done < /tmp/links.txt
  # utilizando o parametro -n no cat para listar por indice
  cat -n /tmp/links_formated.txt
  echo " "
}


function show_page {
  echo -e "\e[01;35m============== Mostrando a página ==============\e[00m"
  cat /tmp/site.html | sed -r 's/$/temp/g' | sed -r 's/body \{.+\}//g' | tr '\n' '2' | sed 's/<[^>]*>//g' | sed 's/temp2/\n/g'
}


function access_link {
  show_links
  read -p "Informe o indice do link: " select_link
  contador=0
  while read -r linha_start
  do 
    let contador=contador+1
    linha=$(sed -n ${contador}p /tmp/links_formated.txt)
    if [ $contador == $select_link ];
    then
      wget -q $linha -O /tmp/site.html
      link=$linha
    fi
  done < /tmp/links_formated.txt
  clear
}

function list_images {
  rm /tmp/images.txt /tmp/images_final.txt &>/dev/null
  echo -e "\e[01;35m============== Listando as imagens ==============\e[00m"
  cat /tmp/site.html |grep -E -o '<img[^>]*src="([^"]*)"' | sed -E 's/<img|src=| |"//g' >/tmp/images.txt
  contador=0
  while read -r linha_start
  do 
    let contador=contador+1
    linha=$(sed -n ${contador}p /tmp/images.txt)
    if [ $(echo $linha |grep -Eo '^.') == '/' ];
    then 
      echo " $link$linha" >> /tmp/formated_images.txt
    else 
      echo $linha >> /tmp/formated_images.txt
    fi 
  done < /tmp/images.txt
  cat -n /tmp/formated_images.txt    
  echo " " 
}

function download_image {
  list_images
  read -p "Informe o indice da imagem: " select_image
  contador=0
  while read -r linha_start
  do 
    let contador=contador+1
    linha=$(sed -n ${contador}p /tmp/formated_images.txt)
    if [ $contador == $select_image ];
    then
      echo -e "\e[00;32mDownloading...\e[00m\n"
      sleep 2
      wget $linha
      sleep 1
      echo -e "\e[01;32m[!] Sucesso! Imagem Baixada. [!]\e[00m\n"
      link=$linha
    fi
  done < /tmp/formated_images.txt
  echo " "
}