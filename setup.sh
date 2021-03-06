#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential libssl-dev git curl

sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz
sudo tar -xvf go1.9.4.linux-amd64.tar.gz
sudo cp -r go/ /usr/local/
sudo rm -rf go/ go1.9.4.linux-amd64.tar.gz
sudo echo "export GOROOT=/usr/local/go" >> ~/.bashrc
sudo echo "export GOPATH=$HOME/projects/go" >> ~/.bashrc
sudo echo "PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
 export GOROOT=/usr/local/go
 export GOPATH=$HOME/projects/go
 export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
 echo "**************************Worked this far 1**********************************************************"

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
#sudo mv /usr/bin/geth /usr/bin/normalGeth
echo "**************************Worked this far 2**********************************************************"
sudo  git clone https://github.com/jpmorganchase/quorum.git
 cd quorum
sudo git checkout 0905eda48eb07a4ce0e7072c1a2ecbf690ddff77
sudo make all
echo "**************************Worked this far 3**********************************************************"
sudo  echo "PATH=\$PATH:"$PWD/build/bin >> ~/.bashrc
source ~/.bashrc
export PATH=$PWD/build/bin:$PATH
echo "**************************Worked this far 4**********************************************************"
 cd ..
sudo mkdir -p constellation && cd constellation/
sudo apt-get install -y unzip libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
sudo wget https://github.com/jpmorganchase/constellation/releases/download/v0.1.0/constellation-0.1.0-ubuntu1604.tar.xz -O constellation-0.1.0-ubuntu1604.tar.xz
sudo  tar -xf constellation-0.1.0-ubuntu1604.tar.xz
sudo chmod +x constellation-0.1.0-ubuntu1604/constellation-node
echo "**************************Worked this far 5**********************************************************"
sudo echo "PATH=\$PATH:"$PWD/constellation-0.1.0-ubuntu1604 >> ~/.bashrc
 source ~/.bashrc
export PATH=$PWD/constellation-0.1.0-ubuntu1604:$PATH
 OLD_GOPATH=$GOPATH
sudo GOPATH=$PWD/istanbul-tools go get github.com/getamis/istanbul-tools/cmd/istanbul
sudo echo "PATH=\$PATH:"$PWD/istanbul-tools/bin >> ~/.bashrc
 export PATH=$PWD/istanbul-tools/bin:$PATH
 GOPATH=$OLD_GOPATH
echo "**************************Worked this far 6**********************************************************"
cd ..
sudo git clone https://github.com/consensys/QuorumNetworkManager.git
 cd QuorumNetworkManager/
sudo git checkout v0.7.2-alpha
sudo npm install
echo "**************************Worked this far 7**********************************************************"
