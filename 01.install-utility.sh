#!/bin/bash
. package-install-apt.sh

sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update -y 

_installMany "libcurl4-gnutls-dev" "libgconf-2-4" "gettext" "libssl-dev" "ubuntu-restricted-extras" "gnome-tweak-tool" "zsh" "curl" "vlc" "ffmpeg" "gparted" "gufw" "htop" "curl" "htop" "figlet" "cowsay" "screenfetch" "xclip" "youtube-dl" "synaptic"

