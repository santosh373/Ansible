#!/bin/bash
count=0
while true; do
    inactive_status=$(systemctl status ntpd | grep -c 'inactive' | tail -1)

    if [ $inactive_status -ge 1 ]; then
        echo "starting the ntpd service"
        systemctl restart ntpd
        if [ $? -eq 0 ]; then
            echo "ntpd service started successfully"
            break;
        else
            if [ $count -eq 10 ]; then
                echo "Issue with the ntp server in host `hostname`" | mail -s "NTP Issue on `hostname`"
                break;
            fi
        fi
    else
        echo "NTP is already running....exiting\!\! "
        break;
    fi
    count=$((count+1))
done

