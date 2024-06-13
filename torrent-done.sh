#!/bin/bash
echo "$(date)" > /tmp/torrent-done.log 2>&1
pwd >> /tmp/torrent-done.log 2>&1
# env >> /tmp/torrent-done.log 2>&1
echo "TR_APP_VERSION: $TR_APP_VERSION" >> /tmp/torrent-done.log 2>&1
echo "TR_TIME_LOCALTIME: $TR_TIME_LOCALTIME" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_BYTES_DOWNLOADED: $TR_TORRENT_BYTES_DOWNLOADED" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_DIR: $TR_TORRENT_DIR" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_HASH: $TR_TORRENT_HASH" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_ID: $TR_TORRENT_ID" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_LABELS: $TR_TORRENT_LABELS" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_NAME: $TR_TORRENT_NAME" >> /tmp/torrent-done.log 2>&1
echo "TR_TORRENT_TRACKERS: $TR_TORRENT_TRACKERS" >> /tmp/torrent-done.log 2>&1
cd "$TR_TORRENT_DIR/$TR_TORRENT_NAME" >> /tmp/torrent-done.log 2>&1
pwd >> /tmp/torrent-done.log 2>&1
ls -l >> /tmp/torrent-done.log 2>&1
for file in *.rar; do unrar x "$file"; done
ls -l >> /tmp/torrent-done.log 2>&1
sleep 10m
transmission-remote -t "$TR_TORRENT_ID" -r >> /tmp/torrent-done.log 2>&1
