#!/bin/bash
#As funções solicitadas na questão 7 estão no arquivo functionss.sh :) #

. functionss.sh

while getopts "a:b:c:" flag
do
    case "${flag}" in
	a) A $OPTARG;;
        b) B $OPTARG;;
        c) C $OPTARG;;
    esac
done
