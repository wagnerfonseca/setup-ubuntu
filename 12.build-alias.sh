#!/bin/bash

echo "### Alias" >> ~/.profile
echo "alias c='clear'" >> ~/.profile
echo "alias up='sudo apt update -y && sudp apt upgrade -y'" >> ~/.profile

source $HOME/.profile
