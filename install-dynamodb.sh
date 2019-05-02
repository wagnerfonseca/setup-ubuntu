#!/bin/bash
# Basic installation routine to install 
# Just copy and paste 
# install and start a local Dynamo automatically
#
. package-install-basic.sh

URL=http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz

get_resource $URL
download_resource $URL 
PATH_SOURCE=$HOME/.dynamodblocal
unpack $PATH_SOURCE
remove_source

