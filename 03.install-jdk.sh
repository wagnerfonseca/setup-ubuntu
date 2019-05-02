#!/bin/bash
. package-install-basic.sh

echo "Instalando e substituindo o OpenJDK para o JDK Oracle"

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

sudo apt install oracle-java10-installer
sudo apt install oracle-java10-set-default

# sudo apt install oracle-java8-installer
# sudo apt install oracle-java8-set-default

java -version

# sudo update-alternatives --install /usr/bin/java java ${SOURCE_PATH}/bin/java 1062
# sudo update-alternatives --install /usr/bin/javac javac ${SOURCE_PATH}/bin/javac 1062
