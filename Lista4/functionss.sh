#!/bin/bash

function A {
        c=$(tr -d '[:upper:]' < $1)
        echo "$c" > $1
}

function B {
        c=$(sed 's/[0-9]*//g' < $1)
        echo "$c" > $1
}

function C {
        c=$(awk '{gsub("[^a-zA-Z0-9]","."); print $1}' $1)
        echo "$c" > $1
}

