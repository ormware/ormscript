#!/bin/bash
#commented audio cosmetics for debugging reasons
#pulseaudio --start
#paplay wav/wardriveArmed.wav

mkdir -p ~/scripts/netxml
sudo mv ~/*.netxml ~/scripts/netxml/
sudo rm ~/Kismet*
sudo systemctl stop gpsd.socket; sleep 1
sudo systemctl disable gpsd.socket; sleep 1
sudo gpsd /dev/ttyACM0 -F /var/run/gpsd.sock
if [ $? -eq 1 ]
then
  sudo apt install -y gpsd
  echo "Dependencies successfully installed. Kindly relaunch."; sleep 3
  exit 0
fi

sudo airmon-ng check kill; sleep 1
sudo airmon-ng start wlan1; sleep 1
tmux split-window -v "bash kismet -c wlan1mon"
