#!/bin/bash
echo "connecting to internet..."
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
sudo ifconfig wlan0 up
wpa_passphrase "Krisna" ibutuden69 | sudo tee /etc/wpa_supplicant.conf
sudo killall wpa_supplicant
sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlan0
sudo dhclient wlan0
ifconfig wlan0
echo "successfully connected to internet!"
