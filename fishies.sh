#!/bin/bash
sudo apt-get upgrade
sudo add-apt-repository ppa:ytvwld/asciiquarium
sudo apt update
sleep 1
echo "Fishies downloaded, installing"
sudo apt install asciiquarium -y
