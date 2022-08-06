#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/mybar.log
polybar left 2>&1 | tee -a /tmp/mybar.log & disown
polybar right 2>&1 | tee -a /tmp/mybar.log & disown
polybar left_top 2>&1 | tee -a /tmp/mybar.log & disown
polybar right_top 2>&1 | tee -a /tmp/mybar.log & disown

echo "Bars launched..."
