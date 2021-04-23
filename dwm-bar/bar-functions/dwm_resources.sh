#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    # CPU temperature
    #CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
    CPU=$(printf "%.2s" $(cat /sys/class/thermal/thermal_zone0/temp))
    # Used and total storage in /home (rounded to 1024B)
    STOUSED=$(df -h | grep '/home$' | awk '{print $3}')

    TEMPSTATUS=$(cat ./tempStatus)

    if [ "$((CPU))" -gt 70 ]; then
            if ["$TEMPSTATUS" == "0"]; then
                    dunstify -u low "Cpu is getting hot"
                    $(echo "1" > ./tempStatus)
            fi
            if ["$((CPU))" -gt 100 ]; then
                    dunstify -u critical "Cpu Overheat"
            fi

    else
            $(echo "0" > ./tempStatus)
    fi
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "[💻 MEM %s/%s CPU %s\\u00B0]\n" "$MEMUSED" "$MEMTOT" "$CPU"
    else
        printf "[MEM %s/%s CPU %sC]\n" "$MEMUSED" "$MEMTOT" "$CPU" 
    fi
}

dwm_resources
