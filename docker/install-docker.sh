#!/bin/bash
set -u
set -e
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YLW=`tput setaf 3`
NC=`tput sgr0` # No Color

echo -n "Installing pre-requists... "
sudo apt-get -qq install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "${GREEN}Done.${NC}"

echo -n "Installing Docker’s official GPG key... "
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null #only silent on success
echo "${GREEN}Done.${NC}"

echo -n "Verifying GPG key fingerprint... "
fingerprint=`sudo apt-key fingerprint 0EBFCD88 |grep fingerprint|tr -d 'Keyfingerprint ='`
if [ "$fingerprint" != "9DC858229FC7DD38854AE2D88D81803C0EBFCD88" ]
then
  echo -e "\n${RED}Error: GPG key fingerprint doesn't match. Exiting!${NC}\n"
  exit 1
fi
echo "${GREEN}Done.${NC}"

echo -n "Adding docker PPA... "
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "${GREEN}Done.${NC}"

echo -n "Installing tools to allow apt repository over https... "
sudo apt-get -qq install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "${GREEN}Done.${NC}"

echo -n "Running apt-get update... "
sudo apt-get -qq update
echo "${GREEN}Done.${NC}"

echo -n "Installing docker-ce... "
sudo apt-get -qq install -y docker-ce
echo "${GREEN}Done.${NC}"

echo -n "Verifying Docker installation... "
run_output=`sudo docker run hello-world`
if [[ $run_output == *"Hello from Docker"* ]]
then
  echo "${GREEN}Done.${NC}"
else
  echo -e "\n${RED}Error: Couldn't verify Docker installation. Exiting!${NC}"
  exit 1
fi

echo -n "Enabling Docker startup on boot... "
sudo systemctl -q enable docker
echo "${GREEN}Done.${NC}"

echo -n "Setting up groups for non-sudo usage... "
sudo groupadd -f docker
sudo usermod -aG docker $USER
echo "${GREEN}Done.${NC}"

echo "${YLW}Note: you need to logout and login again to use docker without requiring sudo${NC}"
echo "${GREEN}Enjoy Docker goodness :)${NC}"
