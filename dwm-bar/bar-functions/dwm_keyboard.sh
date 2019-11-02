#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-setxkbmap

dwm_keyboard () {
COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

case "$COMMAND" in

 "00000000"|"00000001") printf "[KEY us,el]" ;;

 "00001000"|"00001001") printf "[KEY el,us]" ;;

  *) LAYOUT="??" ;;

esac
}

dwm_keyboard
