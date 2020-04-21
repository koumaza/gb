sudo apt update  -y
sudo apt install -y nodejs npm  git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip squashfs-tools python-mako libssl-dev ninja-build lunzip syslinux syslinux-utils gettext genisoimage gettext bc xorriso
sudo npm install n -g
sudo n latest
sudo apt purge -y nodejs npm
sudo apt-add-repository 'deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe'
sudo apt update  -y
sudo apt install -y jq openjdk-8-jdk golang-1.14 tree
sudo npm install -g github-release-cli
exec $SHELL -l
    
bash buildscript.sh
