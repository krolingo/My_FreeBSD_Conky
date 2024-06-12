## Server Ping Status Conky

This conky uses a script to ping user defined servers.

![](ping_screen.png)

```sh
#!/bin/sh

# Define a timestamp function with formatting
timestamp() {
    echo "\${font NotoColorEmoji:size=8}     \${font}\${font agave Nerd Font-8}\${color slate grey}$(date +%T)\${color}\${font}"
}

while true; do
  start_time=$(date +%s)
  output=""
  for server in pfsense truenas synology fileserver freebsd.org github.com 8.8.8.8 1.1.1.1 apple.com; do
    if ping -c 1 "$server" > /dev/null 2>&1; then
      output="$output\${color #0df658}\${font MonoidNerdFont:size=9:bold}\${font}\${color #0df658}\${font GoMonoNFP:size=9:bold} ${server}\${font}\${font MonoidNerdFont:size=8:bold} ONLINE \${font} \${color}\n"
    else
      output="$output\${font NotoColorEmoji:size=8}☎\${font}\${color #ff4f00}\${font GoMonoNFP:size=9:bold}  ${server} \${font}\${color red}\${font MonoidNerdFont:size=8:bold}󱓇 OFFLINE 󱓇\${font} \ \${color}\n"
    fi
  done
  # Add timestamp to output
  output="$output$(timestamp)\n"
  # Write the output to the file
  printf "%b" "$output" > /tmp/server_status

  # Calculate the elapsed time and sleep for the remaining time to make it exactly 5 seconds
  end_time=$(date +%s)
  elapsed_time=$((end_time - start_time))
  sleep_time=$((1 - elapsed_time))
  if [ $sleep_time -gt 10 ]; then
    sleep $sleep_time
  fi
done
```

