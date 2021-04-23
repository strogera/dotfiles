#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-setxkbmap

dwm_keyboard () {
COMMAND=$(xset -q | grep LED | awk '{ print $10 }')
PREVLAYOUT=$(cat ./layout)

if [ "$PREVLAYOUT" != "$COMMAND" ]; then
        if [ "${PREVLAYOUT: -1}" = "${COMMAND: -1}" ]; then
                dunstify -u low "Layout changed"
        elif [ "$(("${PREVLAYOUT: -1}"))" -gt "$(("${COMMAND: -1}"))" ]; then
                dunstify -u low "Caps Lock: Off"
        else
                dunstify -u low "Caps Lock: On"
        fi
fi
$(echo "$COMMAND" > ./layout)

case "$COMMAND" in

 "00000000") printf "[KEY us]" ;;
 "00000001") printf "[KEY Us]" ;;

 "00001000") printf "[KEY el]" ;;
 "00001001") printf "[KEY El]" ;;

  *) LAYOUT="??" ;;

esac
}

dwm_keyboard
