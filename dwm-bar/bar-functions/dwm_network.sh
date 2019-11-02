#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_network () {

    printf "[NET"
    flag=true

    for i in $(ls -A1 /sys/class/net/) ;do 
		if ! $(iw $i link | grep -q "Not"); then
			printf " %s" $i
			flag=false
		fi
    done

    if  $flag; then
	    printf " NONE]"
    else
	    SIGNAL=$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3*100/70) "%" }')
	    if [ "$IDENTIFIER" = "unicode" ]; then
		printf "[🌐 %s %s | %s]\n" "$CONNAME" "$PRIVATE" "$PUBLIC"
	    else
		printf ":%s]\n" "$SIGNAL" 
	    fi
    fi
}

dwm_network
