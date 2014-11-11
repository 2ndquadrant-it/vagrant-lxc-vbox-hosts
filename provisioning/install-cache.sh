#!/bin/bash

VAGRANT_HOME=/home/vagrant/.vagrant.d su -p vagrant -c '
  if ! $(vagrant plugin list | grep -q cachier); then
    vagrant plugin install vagrant-cachier
  fi
'

mkdir -p /home/vagrant/.vagrant.d
CACHEDIR=/home/vagrant/.vagrant.d/cache
test -d $CACHEDIR && rm -fr $CACHEDIR
mkdir -p /vagrant/.container/cache
ln -nfs /vagrant/.container/cache $CACHEDIR

mkdir -p /home/vagrant/.vagrant.d
BOXDIR=/home/vagrant/.vagrant.d/boxes
test -d $BOXDIR && rm -fr $BOXDIR
mkdir -p /vagrant/.container/boxes
ln -nfs /vagrant/.container/boxes $BOXDIR
