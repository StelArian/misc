#!/bin/bash
IP_FILE="/var/lib/freedns_last_ip"
CURRENT_IP=$(curl -s http://checkip.amazonaws.com)
UPDATE_URL="https://username:password@freedns.afraid.org/nic/update?hostname=subdomain.mooo.com&myip=$CURRENT_IP"
if [ -f "$IP_FILE" ]; then
    LAST_IP=$(cat "$IP_FILE")
else
    LAST_IP=""
fi
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "$(date) - IP has changed to $CURRENT_IP. Updating FreeDNS." >> /var/log/freedns_update.log
    curl -s "$UPDATE_URL" > /dev/null
    echo "$CURRENT_IP" > "$IP_FILE"
else
    echo "$(date) - IP has not changed. No update needed." >> /var/log/freedns_update.log
fi
tail -n 100 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"
