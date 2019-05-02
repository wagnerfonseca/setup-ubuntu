#!/bin/bash

wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O megasync.deb

wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/nautilus-megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O nautilus-megasync.deb

if ! sudo apt install ./megasync.deb then
    echo "MEGAsync instalado com sucesso"
else
    sudo apt-get install -f
fi

if ! sudo apt install ./nautilus-megasync.deb then
    echo "MEGAsync Nautilus instalado com sucesso"
else
    sudo apt-get install -f
fi

rm megasync.deb

rm nautilus-megasync.deb
