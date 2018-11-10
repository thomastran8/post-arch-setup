#!/bin/sh

# Torrent setup
mkdir -p ~/torrents
mkdir -p ~/torrents/tor_queue
mkdir -p ~/torrents/tor_complete
mkdir -p ~/torrents/incomplete
mkdir -p ~/torrents/completed
mkdir -p ~/torrents/scripts
cp ./torrents/scripts/* ~/torrents/scripts 

# Check if any transmission daemons are running
ps -e | grep transmission-da
if [ $? -eq 0 ]; then
    echo Removing transmission daemon...
    pkill -f transmission-da
fi

# Remove old config
if [ -d ~/.config/transmission-daemon ]; then
    echo Deleting old config...
    rm -rf ~/.config/transmission-daemon
fi

# Generate transmission settings file
transmission-daemon
sleep 3
pkill -f transmission-da
sleep 3

sed -i "/\"download-dir\"/c\ \ \ \ \"download-dir\":\ \"/home/${USER}/torrents/completed\"," ~/.config/transmission-daemon/settings.json
sed -i "/\"incomplete-dir\"/c\ \ \ \ \"incomplete-dir\":\ \"/home/${USER}/torrents/incomplete\"," ~/.config/transmission-daemon/settings.json
sed -i "/\"incomplete-dir-enabled\"/c\ \ \ \ \"incomplete-dir-enabled\":\ true," ~/.config/transmission-daemon/settings.json
sed -i "/\"script-torrent-done-enabled\"/c\ \ \ \ \"script-torrent-done-enabled\":\ true," ~/.config/transmission-daemon/settings.json
sed -i "/\"script-torrent-done-filename\"/c\ \ \ \ \"script-torrent-done-filename\":\ \"/home/${USER}/torrents/scripts/remove-torrents.sh\"," ~/.config/transmission-daemon/settings.json

