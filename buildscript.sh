#!/bin/bash
ls -al */*/

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export repourl= $(cat onfig.yml|yq .repourl[])
export branch=  $(cat config.yml|yq .branch[])

env GO111MODULE=on go get -v github.com/mikefarah/yq/v3
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo ; chmod a+x ./repo

mkdir build && cd build
../repo init -u $repourl-b $branch
../repo sync --no-tags --no-clone-bundle --force-sync -j$(grep processor /proc/cpuinfo | wc -l)
. build/envsetup.sh

$(cat ../config.yml|yq -c .build_command[])
