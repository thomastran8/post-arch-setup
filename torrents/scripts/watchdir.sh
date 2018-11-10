#!/bin/sh

inotifywait -m ~/Downloads -e create -e moved_to |
    while read path action file; do
        # do something with the file
        if [ ${file: -8} == ".torrent" ]; then
            mv ~/Downloads/$file ~/torrents/tor_queue
        fi
    done
