#!/bin/bash
# Toggle screen internal

xrandr --listactivemonitors | grep "Monitors: 2" && {
  xrandr --output eDP-1 --off
  echo "Mode ecran externe"
  pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo
  xrandr --output DP-1 --scale 0.7x0.7
  exit
}

xrandr --listactivemonitors | grep "Monitors: 1" && {
  xrandr --output eDP-1 --preferred --right-of DP-1
  xrandr --output DP-1 --scale 1x1
  pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
  echo "Mode double ecran"
  exit
}
