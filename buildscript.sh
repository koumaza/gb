#!/bin/bash
tree
export WORK=$PWD
export GOPATH=$WORK/go
export PATH=$PATH:$GOPATH/bin
export yq=$GOPATH/bin/yq

env GO111MODULE=on go get -v github.com/mikefarah/yq/v3

export repourl="$($yq r config.yml repourl)"
export branch="$($yq r config.yml branch)"


curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo ; chmod a+x ./repo

mkdir build && cd build
../repo init -u "$repourl" -b "$branch"
../repo sync --no-tags --no-clone-bundle --force-sync -j$(grep processor /proc/cpuinfo | wc -l)
. build/envsetup.sh

$($yq r ../config.yml build_command)
