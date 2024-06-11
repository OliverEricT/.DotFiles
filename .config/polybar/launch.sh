#!/bin/bash

polybar-msg cmd quit
killall -q polybar

#launch bar1, bar2, and bar3
echo "---" | tee -a /tmp/polybar.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar1 &
  done
else
  polybar --reload bar1 &
fi

echo "Bars launched..."
