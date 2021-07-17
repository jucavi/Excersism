#!/usr/bin/env bash
if [ "$#" -lt 2 ]
then
    if [ -z "$1" ]
    then
        echo "Usage: ./error_handling <greetee>"
        exit 1
    else
        echo "Hello, $1"
    fi
else
    exit 2
fi
