#!/bin/sh

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

while true; do
  wpa_cli status | grep "ip_address" | awk '{ sub("ip_address=", "", $1); print $1 }' > /tmp/wifi_ip
  bssid=$(wpa_cli status | grep "bssid=" | awk '{ sub("bssid=", "", $1); print $1 }')

  # Check if BSSID is not empty
  if [ -n "$bssid" ]; then
    printf "%s" "$bssid" > /tmp/wifi_bssid
  fi

  "$SCRIPT_DIR/__wifi_strength_ifconfig.sh" > /tmp/wifi_signal_strength

  #curl -s ifconfig.me > /tmp/public_ip

  sleep 1

  # Write the output of the command to the named pipe
  "$SCRIPT_DIR/__wifi_strength_ifconfig.sh" > /tmp/wifi_output &

  sleep 5
done
