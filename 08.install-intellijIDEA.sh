#!/bin/bash
. package-install-basic.sh

VERSION="2018.3.4"
URL="https://download.jetbrains.com/idea/ideaIU-${VERSION}.tar.gz"

DESTINY_PATH="/opt/Intellij-IDEA"

get_resource $URL
download_resource $URL
unpack $DESTINY_PATH

remove_source