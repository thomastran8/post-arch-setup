#!/bin/sh

# Gets filename
file=$(/usr/bin/transmission-remote 127.0.0.1:9091 -l | grep 100% | awk '{print $10}')

# Move queued torrents to completed directory
mv ~/torrents/tor_queue/$file.torrent ~/torrents/tor_complete

# Send notification
notify-send -t 5000 "$file has finished downloading"

# Remove torrent using process ID
/usr/bin/transmission-remote 127.0.0.1:9091 -l | grep 100% | awk '{print $1}' | xargs -n 1 -I % /usr/bin/transmission-remote 127.0.0.1:9091 -t % -r

