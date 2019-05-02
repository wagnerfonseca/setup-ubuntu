## Instrution get in: https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

DIRETORIO_FONT="~/.local/share/fonts/"

if [ ! -d "$DIRETORIO_FONT" ]; then
  mkdir $DIRETORIO_FONT
fi

mv PowerlineSymbols.otf $DIRETORIO_FONT

fc-cache -vf $DIRETORIO_FONT

DIRETORIO_CONFD="~/.config/fontconfig/conf.d/"

if [ ! -d "$DIRETORIO_CONFD" ]; then
  mkdir $DIRETORIO_CONFD
fi

mv 10-powerline-symbols.conf $DIRETORIO_CONFD