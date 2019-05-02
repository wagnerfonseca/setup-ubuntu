#!/bin/bash

cd $HOME

zsh 1 2 1 0

## Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Definindo o ZSH com Shell padrão
sudo -s

chsh $(which zsh) root
# chsh $(which zsh) [Nome do Usuario]

exit

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\"" >> ~/.zshrc
echo "DEFAULT_USER=$USER" >> ~/.zshrc
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)" >> ~/.zshrc
echo "POWERLEVEL9K_PROMPT_ON_NEWLINE=true" >> ~/.zshrc
echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=\"▶ \"" >> ~/.zshrc
echo "POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=\"\"" >> ~/.zshrc