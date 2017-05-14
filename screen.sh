#!/bin/bash
# Toggle screen internal

xrandr --listactivemonitors | grep "Monitors: 2" && {
  xrandr --output eDP-1 --off
  echo "Disabled screen"
  exit
}

xrandr --listactivemonitors | grep "Monitors: 1" && {
  xrandr --output eDP-1 --preferred --right-of DP-1
  echo "Enabling screen"
  exit
}
