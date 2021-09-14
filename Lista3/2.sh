echo "> Antes de utilizar o comando ''tr''"
cat $1
echo "> Após utilizar o comando ''tr'' <"
tr 0-9 "*" < $1