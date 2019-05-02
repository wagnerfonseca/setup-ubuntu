#!/bin/bash
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz
sudo cp -r Postman /usr/local
sudo ln -s /usr/local/Postman/Postman /usr/bin/postman

#Create a Desktop Entry
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/usr/local/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

sudo rm -rf Postman
rm postman.tar.gz