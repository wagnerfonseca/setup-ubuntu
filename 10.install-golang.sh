#!/bin/bash
. package-install-basic.sh

VERSION="1.12.4"
SOURCE_NAME="go${VERSION}"
SOURCE_ARCHIVE="${SOURCE_NAME}.linux-amd64.tar.gz"

URL="https://dl.google.com/go/$SOURCE_ARCHIVE" 

get_resource $URL
download_resource $URL
unpack "/usr/local"
config_environment "GOROOT"
remove_source