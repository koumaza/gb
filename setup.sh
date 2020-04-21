sudo apt update  -y
sudo apt install -y nodejs npm
sudo npm install n -g
sudo n latest
sudo apt purge -y nodejs npm
sudo apt-add-repository 'deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe'
sudo apt update  -y
sudo apt install -y jq openjdk-8-jdk golang-1.14 tree
sudo npm install -g github-release-cli
exec $SHELL -l
    
bash buildscript.sh
