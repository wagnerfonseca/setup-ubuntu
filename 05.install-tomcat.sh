#!/bin/bash
. package-install-basic.sh

TOMCAT_VERSION=7.0.94
TOMCAT_NAME=apache-tomcat-$TOMCAT_VERSION
TOMCAT_ARCHIVE=$TOMCAT_NAME.tar.gz
TOMCAT_URL=http://ftp.unicamp.br/pub/apache/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/$TOMCAT_ARCHIVE
APACHE_PATH=/opt/apache
TOMCAT_PATH=$APACHE_PATH/$TOMCAT_NAME
TOMCAT_START=$TOMCAT_PATH/bin/startup.sh

config_user() {
    NUMBER_LINES=$(sudo cat $TOMCAT_PATH/conf/tomcat-users.xml | wc -l)
    file=$TOMCAT_PATH/conf/tomcat-users.xml
    sudo sed -i "${NUMBER_LINES}i <user username=\"$1\" password=\"$1\" roles=\"manager-gui,admin-gui\"/>" $file
}

install_resource $TOMCAT_URL $APACHE_PATH CATALINA_HOME

config_user