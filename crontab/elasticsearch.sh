#!/bin/bash
count=0
while true; do
    inactive_status=$(systemctl status elasticsearch | grep -c 'inactive' | tail -1)

    if [ $inactive_status -ge 1 ]; then
        echo "starting the elasticsearch service"
        systemctl restart elasticsearch
        if [ $? -eq 0 ]; then
            echo "elasticsearch service started successfully"
            break;
        else
            if [ $count -eq 10 ]; then
                echo "Issue with the elasticsearch server in host `hostname`" | mail -s "elasticsearch Issue on `hostname`"
                break;
            fi
        fi
    else
        echo "elasticsearch is already running....exiting\!\! "
        break;
    fi
    count=$((count+1))
done

