#!/bin/bash
#sudo wifite -i wlan1mon -mac -p 10 --skip-crack --no-pmkid --daemon --clients-only
#while :
#do
sudo wifite -i wlan1mon -mac -p 10 --no-pmkid --skip-crack # -bully --clients-only
#sleep 1
#done
#tmux split-window -v "sh ~/scripts/worms.sh"
