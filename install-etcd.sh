#!/bin/bash
. package-install-basic.sh

VERSION="3.3.10"

URL="https://github.com/etcd-io/etcd/releases/download/v$VERSION/etcd-v$VERSION-linux-amd64.tar.gz"

install_resource_configless $URL /opt/local/bin/etcd

sudo ln -s /opt/local/bin/etcd/etcd-v$VERSION-linux-amd64/etcd /usr/local/bin/etcd
sudo ln -s /opt/local/bin/etcd/etcd-v$VERSION-linux-amd64/etcdctl /usr/local/bin/etcdctl
