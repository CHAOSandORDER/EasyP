#!/bin/bash
pw=$(pwd)
cd /bin
mkdir master
cd -
sudo updatedb
pa=$(locate "easy.sh")
cp $pa /bin/master
export PATH=/bin/master:$PATH
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
cd /bin/master
mv easy.sh E
E
