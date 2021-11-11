#!/bin/bash

update(){
    echo ".........................update starting.........................";
    sudo apt-get update;
    echo ".........................update ended............................";
}

upgrade(){
    echo ".........................upgrade starting.........................";
    sudo apt-get -y upgrade;
    echo ".........................upgrade ended............................";
}

snapd(){
    echo ".........................snapd insatlling.........................";
    update;
    sudo apt-get upgrade;
    echo ".........................snapd install done............................";
}

curl(){
    echo ".........................curl installing.........................";
    update;
    upgrade;
    sudo apt install curl;
    echo ".........................curl install done.........................";

    echo "curl version check: ";
    curl --version;
}

git(){
    echo ".........................git installing.........................";
    sudo apt install git-all;
    echo ".........................git install done.........................";
}

nodejsLTS16(){
    echo ".........................node js LTS 16 installing.........................";
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -;
    sudo apt-get install -y nodejs;
    echo ".........................node js LTS 16 install done.........................";

    echo "node version check: ";
    node -v;
    echo "npm version check: ";
    npm -v;
}

vscode(){
    echo ".........................vscode installing.........................";

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/;
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list';
    rm -f packages.microsoft.gpg;
    sudo apt install apt-transport-https;
    update;
    sudo apt install code;

    echo ".........................vscode install done.........................";
}

intellij(){
    echo ".........................intellij installing.........................";
    sudo snap install intellij-idea-ultimate --classic;
    echo ".........................intellij install done.........................";
}

postman(){
    echo ".........................postman installing.........................";
    sudo snap install postman;
    echo ".........................postman install done.........................";
}

chrome(){
    echo ".........................chrome installing.........................";
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
    sudo apt install ./google-chrome-stable_current_amd64.deb;
    echo ".........................chrome install done.........................";

}

opera(){
    echo ".........................opera installing.........................";
    wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -;
    sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free";
    sudo apt install opera-stable;
    echo ".........................opera install done.........................";
}

stickyNotes(){
    echo ".........................sticky notes installing.........................";
    sudo add-apt-repository ppa:umang/indicator-stickynotes
    update
    sudo apt-get install indicator-stickynotes
    echo ".........................sticky notes install done.........................";
}

slack(){
    echo ".........................slack installing.........................";
    sudo snap install slack --classic
    echo ".........................slack install done.........................";
}

commands[0]="update";
commands[1]="upgrade";
commands[2]="snapd";
commands[3]="curl";
commands[4]="git";
commands[5]="nodejsLTS16";
commands[6]="vscode";
commands[7]="intellij";
commands[8]="postman";
commands[9]="chrome";
commands[10]="opera";
commands[11]="stickyNotes";
#commands[12]="slack";

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