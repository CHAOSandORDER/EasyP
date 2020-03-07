#!/bin/bash
cd /bin
mkdir master
cd -
sudo updatedb
pa=$(locate "easy.sh")
cp $pa /bin/master
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
export PATH=/bin/master:$PATH
echo "export PATH=/bin/master:$PATH" >> ~/.bashrc
E
