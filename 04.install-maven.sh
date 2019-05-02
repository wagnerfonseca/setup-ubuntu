#!/bin/bash
. package-install-basic.sh

VERSION="3.6.1"

URL="http://mirror.nbtelecom.com.br/apache/maven/maven-3/$VERSION/binaries/apache-maven-$VERSION-bin.tar.gz"

install_resource $URL /opt/apache M3

mvn -version

echo Instalação realizada com sucesso