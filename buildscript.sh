#!/bin/bash

env GO111MODULE=on go get github.com/mikefarah/yq/v3

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+x ./repo && export PATH=~$(pwd):$PATH
mkdir build && cd build
../repo init -u $(cat ../config.yml|../go/bin/yq .repourl[]) -b $(cat ../config.yml|../go/bin/yq .branch[])
../repo sync --no-tags --no-clone-bundle --force-sync -j$(grep processor /proc/cpuinfo | wc -l)
. build/envsetup.sh

$(cat ../config.yml|../go/bin/yq -c .build_command[])
