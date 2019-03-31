#!/bin/sh

inotifywait -m ~/Downloads -e create -e moved_to --format '%f' |
    while read file; do
        # check if it's a torrent file
        if [ ${file: -8} == ".torrent" ]; then
            # Give the download some time to create both torrent file and part file
            sleep 1
            # if the file is still downloading, wait until it completes
            while [ -e ~/Downloads/"$file".part ]; do
                sleep 1
            done
            # move the file to the correct location
            mv ~/Downloads/"$file" ~/torrents/tor_queue
        fi
    done

