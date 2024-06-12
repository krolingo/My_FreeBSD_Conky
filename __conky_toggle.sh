#!/bin/sh

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Find and kill all instances of the specified scripts
for script in conky_wpa0/__get_wifi_data.sh conky_ping/check_servers.sh; do
  pids=$(pgrep -f "$SCRIPT_DIR/$script")
  for pid in $pids; do
    kill -9 "$pid"
  done
done

# Find and kill all instances of the specified scripts (alternative approach)
for script in conky_wpa0/__get_wifi_data.sh conky_ping/check_servers.sh; do
  pgrep -f "$SCRIPT_DIR/$script" | xargs -r kill -9
done

# Check if conky is running
# (0) If conky is running, kill all instances of conky
# (1) If conky is not running, run the script to restart conky

pgrep -q conky

case $? in
  (0) killall -9 conky ;;
  (1) "$SCRIPT_DIR/__conky_restart_system_dashboard.sh" ;;
esac
