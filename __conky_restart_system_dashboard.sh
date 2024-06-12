#!/bin/sh

# THIS SOFTWARE USES FREEBSD LICENSE (ALSO KNOWN AS 2-CLAUSE BSD LICENSE)
# https://www.freebsd.org/copyright/freebsd-license.html
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that following conditions are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS 'AS IS' AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ------------------------------
# RESTART CONKY
# ------------------------------

#### XRANDR=$( xrandr )
#### COUNT=$( echo "${XRANDR}" | grep -c " connected " )
#### DELAY=0.2
VERSION=1.9
PROFILE=$( hostname -s )

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Kill all conky processes
killall -9 conky

# Sleep for a moment to ensure processes are killed
sleep 1

# Find and kill all instances of the specified scripts
for script in conky_wpa0/__get_wifi_data.sh conky_ping/check_servers.sh; do
  pgrep -f "$SCRIPT_DIR/$script" | xargs -r kill -9
done

# Additionally, kill any process with check_servers in its details
pgrep -f check_servers | xargs -r kill -9

# Start the scripts
nice -n 20 "$SCRIPT_DIR/conky_wpa0/__get_wifi_data.sh" &
nice -n 20 "$SCRIPT_DIR/conky_ping/check_servers.sh" &

# Start Conky with specified configurations
nice -n 20 conky -c "$SCRIPT_DIR/conky_wpa0/another_internet_wpa0.conf" 1> /dev/null 2> /dev/null &
nice -n 20 conky -c "$SCRIPT_DIR/conky_ping/another_internet_ping.conf" 1> /dev/null 2> /dev/null &
nice -n 20 conky -c "$SCRIPT_DIR/conky_moon/moon_image.lua" 1> /dev/null 2> /dev/null &
nice -n 20 conky -c "$SCRIPT_DIR/conky_beastie/beastie.lua" 1> /dev/null 2> /dev/null &
nice -n 20 conky -c "$SCRIPT_DIR/conky_openweather/openweather.conf" 1> /dev/null 2> /dev/null &
nice -n 20 conky -c "$SCRIPT_DIR/conky_moon_phase/moon_phase_2024.lua" 1> /dev/null 2> /dev/null &


# Uncomment and modify the following lines as needed
#nice -n 20 conky -c ~/.config/conky/ifconfig-conky.conf 1> /dev/null 2> /dev/null &
#nice -n 20 conky -c ~/.config/conky/log-conky.conf 1> /dev/null 2> /dev/null &
#nice -n 20 conky -c ~/.config/conky/sensors-conky.conf 1> /dev/null 2> /dev/null &
#nice -n 20 conky -c ~/.config/conky/input_output.conf 1> /dev/null 2> /dev/null &

# The nice command is used to set the priority of a process.
# The option -n is used to specify the priority value, with a lower number indicating a higher priority.
# A value of 20 is the default priority value and is considered a normal priority.
# So, nice -n 20 sets the priority of the process to a normal priority,
# which means it will share the resources of the system with other processes with the same priority.
# If you want a process to have a lower priority and consume fewer resources, you can use a higher value (e.g. nice -n 19).
# Conversely, if you want a process to have a higher priority and consume more resources, you can use a lower value (e.g. nice -n 10).
# Note that using the nice command does not guarantee that a process will get the requested priority, as it also depends on the system's scheduler.
