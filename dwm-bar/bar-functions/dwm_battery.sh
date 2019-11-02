#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "[🔌 %s %s]\n" "$CHARGE" "$STATUS"
        else
            printf "[🔋 %s %s]\n" "$CHARGE" "$STATUS"
        fi
    else
        if [ "$STATUS" = "Charging" ]; then
		printf "[BAT %s+]\n" "$CHARGE"
	else
		if test "$CHARGE" -le "7"; then
			notify-send "Battery" "Connect Charger Now!"
		fi
		printf "[BAT %s-]\n" "$CHARGE" 
	fi
    fi
}

dwm_battery

