#!/bin/sh

RSSI=$(ifconfig wlan0 list status | awk 'NR==2 {print $5}' | head -1)
RSSI_FLOAT=$(echo "$RSSI" | bc -l)

if [ $(echo "$RSSI_FLOAT >= 90" | bc -l) -eq 1 ]; then
  PERCENTAGE=0
elif [ $(echo "$RSSI_FLOAT >= 50" | bc -l) -eq 1 ]; then
  PERCENTAGE=100
else
  PERCENTAGE=$(echo "scale=2; (100 - (90 - $RSSI_FLOAT))" | bc)
fi

echo "$PERCENTAGE%"

#This script will calculate the percentage based on the RSSI value with decimal points and provide the expected results.
