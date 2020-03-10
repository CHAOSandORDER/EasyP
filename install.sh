#!/bin/bash
echo " YOUR SCRIPT IS INSTALLING................"
cd /bin
mkdir master
cd -
sudo updatedb
pa=$(locate "easy.sh")
cp $pa /bin/master
clear
sleep 4
export PATH=/bin/master:$PATH
sleep 1
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
sleep 1
export PATH=/bin/master:$PATH
sleep 1
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
cd /bin/master
mv easy.sh E
chmod +x E
export PATH=/bin/master:$PATH
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
cd /root
mkdir Easypayloads
cd /root/Easypayloads
mkdir .msft
cd .msft
sudo apt-get install xterm
sudo apt-get install unzip
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip *.zip
clear
echo " YOUR SCRIPT HAS FINISHED INSTALLING."
echo " RUNNING IT FOR YOU "
export PATH=/bin/master:$PATH
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
E
