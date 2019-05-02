#!/bin/bash
. package-install-basic.sh

VERSION="2018.3.4"
URL="https://download.jetbrains.com/idea/ideaIU-${VERSION}.tar.gz"

DESTINY_PATH="/opt/Intellij-IDEA-Community"

get_resource $URL
download_resource $URL
unpack $DESTINY_PATH
create_symlink "bin/idea.sh" "idea.sh"

remove_source