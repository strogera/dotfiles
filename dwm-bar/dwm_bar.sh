#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
#LOC=$(readlink -f "$0")
#DIR=$(dirname "$LOC")

# Change the appearance of the module identifier. if this is set to "unicode", then symbols will be used as identifiers instead of text. E.g. [📪 0] instead of [MAIL 0].
# Requires a font with adequate unicode character support
#export IDENTIFIER="unicode"

# Import the modules
. "/usr/local/dwm-bar/bar-functions/dwm_resources.sh"
. "/usr/local/dwm-bar/bar-functions/dwm_battery.sh"
. "/usr/local/dwm-bar/bar-functions/dwm_alsa.sh"
. "/usr/local/dwm-bar/bar-functions/dwm_network.sh"
. "/usr/local/dwm-bar/bar-functions/dwm_keyboard.sh"
. "/usr/local/dwm-bar/bar-functions/dwm_date.sh"

# Update dwm status bar every second
while true
do
	xsetroot -name "$(dwm_resources)$(dwm_battery)$(dwm_alsa)$(dwm_network)$(dwm_keyboard)$(dwm_date)"
    sleep 1
done
