#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-main.log /tmp/polybar-top.log /tmp/polybar-bottom.log
polybar -r main 2>&1 | tee -a /tmp/polybar-main.log & disown
polybar -r sidebar-top 2>&1 | tee -a /tmp/polybar-top.log & disown
polybar -r sidebar-bottom 2>&1 | tee -a /tmp/polybar-bottom.log & disown

echo "Bars launched..."
