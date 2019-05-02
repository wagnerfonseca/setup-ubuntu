#!/bin/bash

case ${OSTYPE} in
    linux-gnu)
        r=$(lsb_release -si)
        if [ $r == "Ubuntu" ] || [ $r == "Debian" ]; then                        
            sudo apt install -y binutils bison gcc make git vim tree jq
        else
            echo "Not Ubuntu..."
        fi
        ;;
    darwin*)
        echo "Hello MacOS"
        ;;
    *) echo Unknown;;
esac