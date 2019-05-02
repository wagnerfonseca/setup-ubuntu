#!/bin/bash

sudo apt update -y

sudo apt upgrade -y

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings get org.gnome.desktop.interface text-scaling-factor
