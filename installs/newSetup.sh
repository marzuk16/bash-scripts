#!/bin/bash

update(){
    echo ".........................update starting.........................";
    sudo apt-get update;
    echo ".........................update ended............................";
}

upgrade(){
    echo ".........................upgrade starting.........................";
    sudo apt-get upgrade;
    echo ".........................upgrade ended............................";
}

git(){
    echo ".........................git installing.........................";
    sudo apt install git-all;
    echo ".........................git install done.........................";
}

commands[0]="update";
commands[1]="upgrade";

echo "------------------------------";
echo "Executing commands."
echo "------------------------------";

for item in ${commands[@]}
    do
        $item
    done

echo "------------------------------";
echo "Finished executing commands."
echo "------------------------------";