## Instalar ZSH e OhMyZsh

Configuração básicas para a criação do arquivo `~/.zshrc`

Escolha a sequencia de opções para configuração basica
```
1 
2 
1 
0
```

### Install OhMyZsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Definindo o ZSH com Shell padrão

#### Configurando o zsh com  shell padrão
Logar como Root
```
sudo -s
```
Verifica onde esta o _zsh_
```
which zsh
```
`/usr/bin/zsh`
```
chsh -s $(which zsh) root
or
chsh -s /usr/bin/zsh root
```
Configurar outros usuários
```
chsh -s $(which zsh) [Nome do Usuario]
```
Verificar Shell
```
echo $SHELL
```
O resultado deve ser o mesmo de *$(which zsh)*

### Instalando o powerlevl9k

```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Alterar o arquivo  `~/.zshrc`

```
echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\"" >> ~/.zshrc
echo "DEFAULT_USER=$USER" >> ~/.zshrc
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)" >> ~/.zshrc
echo "POWERLEVEL9K_PROMPT_ON_NEWLINE=true" >> ~/.zshrc
echo "POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=\"▶ \"" >> ~/.zshrc
echo "POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=\"\"" >> ~/.zshrc
```