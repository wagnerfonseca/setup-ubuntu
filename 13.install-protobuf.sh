#!/bin/bash
. package-install-basic.sh

## Pacotes básicos
sudo apt install autoconf automake libtool make g++ unzip -y


VERSION="3.7.1"
SOURCE_NAME="protoc-${VERSION}"
SOURCE_ARCHIVE="${SOURCE_NAME}-linux-x86_64.zip"

URL="https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/${SOURCE_ARCHIVE}"

download_resource $URL

sudo mkdir -p /opt/protoc3
sudo unzip ${SOURCE_ARCHIVE} -d /opt/protoc3

sudo ln -s /opt/protoc3/bin/* /usr/local/bin/
sudo ln -s /opt/protoc3/include/* /usr/local/include

remove_source

protoc --version