#!/bin/sh

line=$(acpi -b | grep -v 'rate information unavailable')
val=$(echo $line | cut -d ' ' -f4 | tr -d '%,\n' )
stat=$(echo $line | cut -d ' ' -f3| tr -d ',\n' )
battery_stat=""

if [[ $stat == *"Discharging"* ]]; then
    if [[ $val -ge 70 ]]; then
        battery_stat=""
        val="<span foreground='green'>$val %</span>"
    elif [[ $val -ge 60 ]]; then
        battery_stat=""
        val="<span foreground='yellow'>$val %</span>"
    elif [[ $val -ge 40 ]]; then
        battery_stat=""
        val="<span foreground='yellow'>$val %</span>"
    elif [[ $val -ge 20 ]]; then
        battery_stat=""
        val="<span foreground='yellow'>$val %</span>"
    else
        battery_stat=""
        val="<span foreground='red'>$val %</span>"
    fi
elif [[ $stat == *"Charging"* ]]; then
    battery_stat="<span foreground='yellow'></span>"
    val+=" %"
fi

echo "$battery_stat $val"
