#!/bin/bash
count=0
while true; do
    inactive_status=$(systemctl status rabbitmq | grep -c 'inactive' | tail -1)

    if [ $inactive_status -ge 1 ]; then
        echo "starting the rabbitmq service"
        systemctl restart rabbitmq
        if [ $? -eq 0 ]; then
            echo "rabbitmq service started successfully"
            break;
        else
            if [ $count -eq 10 ]; then
                echo "Issue with the rabbitmq server in host `hostname`" | mail -s "rabbitmq Issue on `hostname`"
                break;
            fi
        fi
    else
        echo "rabbitmq is already running....exiting\!\! "
        break;
    fi
    count=$((count+1))
done

