<<'###'

    Author: Marzuk Islam, Jr. SE (Ethics Advance Technology Ltd)
    Title: This scripts use for some essential softwares
            install for software enigineer after fresh setup.
###

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

curl(){
    echo ".........................curl installing.........................";
    update;
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
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh;
    nano nodesource_setup.sh;
    sudo bash nodesource_setup.sh;
    sudo apt install nodejs -y;
    echo ".........................node js LTS 16 install done.........................";

    echo "node version check: ";
    node -v;
    echo "npm version check: ";
    npm -v;
}

yarn() {
	echo "............................yarn install................."
	sudo npm install --global yarn
	yarn --version
	echo ".........................yarn install done.........................";
}

vscode(){
    echo ".........................vscode installing.........................";

    sudo snap install --classic code

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
    sudo apt install opera-stable -y;
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

telegram(){
    echo ".........................telegram installing.........................";
    sudo add-apt-repository ppa:atareao/telegram
    sudo apt update && sudo apt install telegram
    echo ".........................telegram install done.........................";
}

commands[0]="update";
commands[1]="upgrade";
commands[2]="curl";
commands[3]="git";
commands[4]="nodejsLTS16";
commands[5]="yarn";
commands[6]="vscode";
commands[7]="intellij";
commands[8]="postman";
commands[9]="chrome";
commands[10]="opera";
commands[11]="stickyNotes";
commands[12]="slack";
commands[13]="telegram";

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
