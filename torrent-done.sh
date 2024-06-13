#!/bin/bash

# Log the current date and time to a file named torrent-done.log in the /tmp directory
echo "$(date)" > /tmp/torrent-done.log 2>&1

# Log the current working directory to the log file
pwd >> /tmp/torrent-done.log 2>&1

# Log various environment variables to the log file. These variables are set by Transmission when it calls the script.
echo "TR_APP_VERSION: $TR_APP_VERSION" >> /tmp/torrent-done.log 2>&1
echo "TR_TIME_LOCALTIME: $TR_TIME_LOCALTIME" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_BYTES_DOWNLOADED: $TR_TORRENT_BYTES_DOWNLOADED" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_DIR: $TR_TORRENT_DIR" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_HASH: $TR_TORRENT_HASH" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_ID: $TR_TORRENT_ID" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_LABELS: $TR_TORRENT_LABELS" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_NAME: $TR_TORRENT_NAME" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_TRACKERS: $TR_TORRENT_TRACKERS" >> /tmp/torrent-done.log 2>&1

# Change the current directory to the directory of the downloaded torrent
cd "$TR_TORRENT_DIR/$TR_TORRENT_NAME" >> /tmp/torrent-done.log 2>&1

# Log the new current directory to the log file
pwd >> /tmp/torrent-done.log 2>&1

# Log the contents of the current directory to the log file
ls -l >> /tmp/torrent-done.log 2>&1

# Extract all RAR archives in the current directory
for file in *.rar; do unrar x "$file"; done

# Log the contents of the current directory to the log file again, showing the files that were extracted from the RAR archives
ls -l >> /tmp/torrent-done.log 2>&1

# Pause the script for 10 minutes
sleep 10m

# Remove the torrent from Transmission using its ID
transmission-remote -t "$TR_TORRENT_ID" -r >> /tmp/torrent-done.log 2>&1
