#!/bin/bash
. package-install-basic.sh

VERSION="2018.2.5"
URL="https://download.jetbrains.com/datagrip/datagrip-${VERSION}.tar.gz"

DESTINY_PATH="/opt/Datagrip"

get_resource $URL
download_resource $URL
unpack $DESTINY_PATH
