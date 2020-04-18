#!/bin/bash

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo && export PATH=~/bin/repo:$PATH
mkdir build && cd build
~/bin/repo init -u $(cat ../config.yml|yq .repourl) -b $(cat ../config.yml|yq .branch)
~/bin/repo sync --no-tags --no-clone-bundle --force-sync -j$(grep processor /proc/cpuinfo | wc -l)

$(cat ../config.yml|yq -c .build_command[])

. build/envsetup.sh
