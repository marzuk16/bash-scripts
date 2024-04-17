<<'###'

    Author: Marzuk Islam, Jr. SE (Dynamic solution innovators Ltd)
    Title: This scripts use for some essential softwares
            install for software enigineer after fresh setup.
###

#!/bin/bash

errors=("s");

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
    sudo apt install curl || errors[1]="curl";
    echo ".........................curl install done.........................";

    echo "curl version check: ";
    curl --version;
}


git(){
    echo ".........................git installing.........................";
    sudo apt install git-all || errors[2]="git";
    echo ".........................git install done.........................";
}

openJdk11(){
    echo ".........................open jdk 11 installing.........................";
    sudo apt-get install openjdk-11-jdk || errors[3]="openjdk11";
    echo ".........................open jdk 11 install done.........................";
}

maven(){
    echo ".........................maven installing.........................";
    update;
    sudo apt install maven || errors[4]="maven";
    echo ".........................maven install done.........................";
}

nodejsLTS16(){
    echo ".........................node js LTS 16 installing.........................";
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh;
    nano nodesource_setup.sh;
    sudo bash nodesource_setup.sh;
    sudo apt install nodejs -y;
    if[ $? -ne 0]
    then
    	errors[5]="node";
    fi
    echo ".........................node js LTS 16 install done.........................";

    echo "node version check: ";
    node -v;
    echo "npm version check: ";
    npm -v;
}

yarn() {
	echo "............................yarn install................."
	sudo npm install --global yarn || errors[6]="yarn";
    echo "yarn version check: ";
	yarn --version
	echo ".........................yarn install done.........................";
}

vscode(){
    echo ".........................vscode installing.........................";
    sudo snap install --classic code || errors[7]="vscode";
    echo ".........................vscode install done.........................";
}

intellij(){
    echo ".........................intellij installing.........................";
    sudo snap install intellij-idea-ultimate --classic || errors[8]="intellij";
    echo ".........................intellij install done.........................";
}

postman(){
    echo ".........................postman installing.........................";
    sudo snap install postman || errors[9]="postman";
    echo ".........................postman install done.........................";
}

chrome(){
    echo ".........................chrome installing.........................";
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
    sudo apt install ./google-chrome-stable_current_amd64.deb;
    if[ $? -ne 0]
    then
    	errors[10]="chrome";
    fi
    echo ".........................chrome install done.........................";

}

opera(){
    echo ".........................opera installing.........................";
    wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -;
    sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free";
    sudo apt install opera-stable -y;
    if[ $? -ne 0]
    then
    	errors[11]="opera";
    fi
    echo ".........................opera install done.........................";
}

stickyNotes(){
    echo ".........................sticky notes installing.........................";
    sudo add-apt-repository ppa:umang/indicator-stickynotes
    update
    sudo apt-get install indicator-stickynotes || errors[12]="stickyNotes";
    echo ".........................sticky notes install done.........................";
}

slack(){
    echo ".........................slack installing.........................";
    sudo snap install slack --classic || errors[13]="slack";
    echo ".........................slack install done.........................";
}

telegram(){
    echo ".........................telegram installing.........................";
    sudo add-apt-repository ppa:atareao/telegram
    update;
    sudo apt install telegram || errors[14]="telegram";
    echo ".........................telegram install done.........................";
}

commands[0]="update";
commands[1]="upgrade";
commands[2]="curl";
commands[3]="git";
commands[4]="openJdk11";
commands[5]="maven";
commands[6]="nodejsLTS16";
commands[7]="yarn";
commands[8]="vscode";
commands[9]="intellij";
commands[10]="postman";
commands[11]="chrome";
commands[12]="opera";
commands[13]="stickyNotes";
commands[14]="slack";
commands[15]="telegram";

echo "------------------------------";
echo "Executing commands."
echo "------------------------------";

for item in ${commands[@]}
    do
        $item
    done

if[${#errors[*]} -gt 1]
then
	echo "----------------------------------------";
	echo " \033[33;5m Couldn't install the following packages: \033[0m";
	for item in ${errors[@]}
		do
			$item
		done
	echo "----------------------------------------";
fi
echo "------------------------------";
echo "Finished executing commands."
echo "------------------------------";
