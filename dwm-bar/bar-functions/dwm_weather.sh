#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

FILE="$HOME/.local/share/weatherreport"
# Change the value of LOCATION to match your city
dwm_weather() {
	if [ ! -f $FILE ] || [ $(stat -c %y "$HOME/.local/share/weatherreportShort" 2>/dev/null | cut -d' ' -f1) != $(date '+%Y-%m-%d') ] || [ $(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1) != $(date '+%Y-%m-%d') ] ; then
		#ping -q -c 1 1.1.1.1 >/dev/null
		curl -s "wttr.in/Athens.Greece" > "$HOME/.local/share/weatherreport"
		curl -s "wttr.in/Athens.Greece?format=1" > "$HOME/.local/share/weatherreportShort"
		notify-send "Weather" "New weather forecast for today."
	fi

	if [ -f "$FILE"Short ] ; then
		WEA=$(cat /home/void/.local/share/weatherreportShort | wc -m )
		if [ "$WEA" -lt 10 ] ; then
			printf "[WEA %s]\n" "$(cat /home/void/.local/share/weatherreportShort | grep -o '[0-9].*')"
		else
			printf "[WEA err]\n"
		fi
	else
		printf "[WEA err]\n"
	fi

}

dwm_weather
