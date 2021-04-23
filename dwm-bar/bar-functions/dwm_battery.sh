#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    USERSTATUS=$(cat ./batteryStatus)
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "[🔌 %s %s]\n" "$CHARGE" "$STATUS"
        else
            printf "[🔋 %s %s]\n" "$CHARGE" "$STATUS"
        fi
    else
        if [ "$STATUS" = "Charging" ]; then
		printf "[BAT %s+]\n" "$CHARGE"
                if [ "$USERSTATUS" = "Low 1" ]; then
                        dunstify -u low "Charger Connected"
                fi
                if [ "$USERSTATUS" = "Low 2" ]; then
                        dunstify -u low "Charger Connected"
                fi
                if [ "$USERSTATUS" = "Disch" ]; then
                        dunstify -u low "Charger Connected"
                fi
                $(echo "Ch" > ./batteryStatus)
	else
                if [ "$USERSTATUS" = "Ch" ]; then
                        dunstify -u low "Charger Disconnected"
                        $(echo "Disch" > ./batteryStatus)
                fi
		if test "$CHARGE" -le "20"; then
                        if [ "$USERSTATUS" = "Low 1" ]; then
                                if test "$CHARGE" -le "7"; then
                                        dunstify -u critical "Almost out of Battery. Connect the Charger!"
                                        $(echo "Low 2" > ./batteryStatus)
                                fi
                        fi
                        if [ "$USERSTATUS" = "Disch" ]; then
                                dunstify  "Battery is getting low"
                                $(echo "Low 1" > ./batteryStatus)
                        fi
                else
                        $(echo "Disch" > ./batteryStatus)
		fi
		printf "[BAT %s-]\n" "$CHARGE" 
	fi
    fi
}

dwm_battery

