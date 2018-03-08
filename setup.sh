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
sudo export GOROOT=/usr/local/go
sudo export GOPATH=$HOME/projects/go
sudo export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
sudo mv /usr/bin/geth /usr/bin/normalGeth

sudo  git clone https://github.com/jpmorganchase/quorum.git
sudo cd quorum/
sudo git checkout 0905eda48eb07a4ce0e7072c1a2ecbf690ddff77
make all
///////////worked this far
sudo  echo "PATH=\$PATH:"$PWD/build/bin >> ~/.bashrc
sudo source ~/.bashrc
sudo export PATH=$PWD/build/bin:$PATH

sudo cd ..
sudo mkdir -p constellation && cd constellation/
sudo apt-get install -y unzip libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
sudo wget https://github.com/jpmorganchase/constellation/releases/download/v0.1.0/constellation-0.1.0-ubuntu1604.tar.xz -O constellation-0.1.0-ubuntu1604.tar.xz
sudo  tar -xf constellation-0.1.0-ubuntu1604.tar.xz
sudo chmod +x constellation-0.1.0-ubuntu1604/constellation-node
sudo echo "PATH=\$PATH:"$PWD/constellation-0.1.0-ubuntu1604 >> ~/.bashrc
sudo source ~/.bashrc
sudo export PATH=$PWD/constellation-0.1.0-ubuntu1604:$PATH

sudo OLD_GOPATH=$GOPATH
sudo GOPATH=$PWD/istanbul-tools go get github.com/getamis/istanbul-tools/cmd/istanbul
sudo echo "PATH=\$PATH:"$PWD/istanbul-tools/bin >> ~/.bashrc
sudo export PATH=$PWD/istanbul-tools/bin:$PATH
sudo GOPATH=$OLD_GOPATH

cd ..
sudo git clone https://github.com/consensys/QuorumNetworkManager.git
sudo cd QuorumNetworkManager/
sudo git checkout v0.7.2-alpha
sudo npm install
