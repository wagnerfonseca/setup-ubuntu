#!/bin/bash

FILE_PROFILE=/home/$USER/.profile

# get_resource <url>
# Extract the name and name of resource's file
# extract <SOURCE_ARCHIVE>
# extract <SOURCE_NAME>
# extract <VERSION>
get_resource() {
	SOURCE_URL="$1"
	if [[ $SOURCE_URL =~ ([^/]+)\-bin\.tar\.gz$ ]]
	then
		SOURCE_ARCHIVE=$BASH_REMATCH
		SOURCE_NAME=${BASH_REMATCH[1]}
	elif [[ $SOURCE_URL =~ ([^/]+)\.tar\.gz$ ]] 
	then 
		SOURCE_ARCHIVE=$BASH_REMATCH
		SOURCE_NAME=${BASH_REMATCH[1]}
	else
		printf "\nIncorrcet format of url!\n"
		exit 1
	fi

	if [[ $SOURCE_NAME =~ ([0-9\.]+) ]]
	then
		VERSION=$BASH_REMATCH
	fi
}

download_resource() {
	SOURCE_URL="$1"	
	if [ -f "$SOURCE_ARCHIVE" ]
	then
		echo "$SOURCE_ARCHIVE found."
	else
		echo "$SOURCE_ARCHIVE not found. So download now."
		if [ ! -e $SOURCE_NAME ]; then
			if [ ! -r $SOURCE_ARCHIVE ]; then
				if [ -n "$(which wget)" ]; then
					wget $SOURCE_URL				
				elif [ -n "$(which curl)" ]; then
					curl -O $SOURCE_URL
				fi
			else
				echo "Source could not be downloaded." 1>&2
				exit 1
			fi
		fi
	fi
}

# unpack <destiny_path>
# unpack tarball 
unpack() {
	DESTINY_PATH="$1"
	SOURCE_PATH=$DESTINY_PATH/$SOURCE_NAME
	echo $SOURCE_PATH
	echo "Descompactando o tarball ${SOURCE_ARCHIVE} e enviando para o diretório ${SOURCE_PATH}"
    if [ ! -d "$SOURCE_PATH" ]; then
        if [ ! -d "$DESTINY_PATH" ]; then
            echo "Criando diretório"
            sudo mkdir -p $DESTINY_PATH
        fi
        if ! sudo tar zxf $SOURCE_ARCHIVE -C $DESTINY_PATH; then
			echo "Houve um erro ao descompactar o arquivo .tar.gz"
			exit 1
		fi
    fi
}

# config environment variable
# config_environment <variable_name>
config_environment() {
    echo "Configurando o Ambiente"
	VARIABLE_NAME="$1"	
	ISCONFIG=$(grep -i ${VARIABLE_NAME} $FILE_PROFILE)
	if [ -z "$ISCONFIG" -a "$ISCONFIG" != " " ]; 
	then
		echo "### ${SOURCE_NAME}" >> ~/.profile
    	echo "export $VARIABLE_NAME=\"$SOURCE_PATH\"" >> ~/.profile
    	echo "export PATH=\$$VARIABLE_NAME/bin:\$PATH" >> ~/.profile
	fi
	source $FILE_PROFILE
}

remove_source() {
	echo "Removendo o tarball ${SOURCE_ARCHIVE}"
	rm $SOURCE_ARCHIVE
}

create_symlink() {
	DESTINY_SOURCE="$1"
	SOURCE="$2"
	SOURCE_PATH_LOCAL=$DESTINY_PATH/$SOURCE_NAME
	sudo ln -s $SOURCE_PATH_LOCAL/$DESTINY_SOURCE /usr/local/bin/$SOURCE
}

# install_resource <url_resource> <destiny_path> <constant_variable_name>
install_resource(){
	URL="$1"
	DESTINY_PATH="$2"
	CONSTANT_NAME="$3"
	get_resource $URL
	download_resource $URL
	unpack $DESTINY_PATH
	config_environment $CONSTANT_NAME
	remove_source
}

install_resource_configless() {
	URL="$1"
	DESTINY_PATH="$2"	
	get_resource $URL
	download_resource $URL
	unpack $DESTINY_PATH	
	remove_source
}
