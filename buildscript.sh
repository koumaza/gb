#!/bin/bash

env GO111MODULE=on go get github.com/mikefarah/yq/v3
ln -s go/bin/yq /usr/bin/yq
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+x ./repo && export PATH=~$(pwd):$PATH
mkdir build && cd build
../repo init -u $(cat ../config.yml|yq .repourl) -b $(cat ../config.yml|yq .branch)
../repo sync --no-tags --no-clone-bundle --force-sync -j$(grep processor /proc/cpuinfo | wc -l)
. build/envsetup.sh

$(cat ../config.yml|yq -c .build_command[])
