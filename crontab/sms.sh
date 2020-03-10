#!bin/bash
count=0
while true; do
    inactive_status=$(systemctl status sms | grep -c 'inactive' | tail -1)

    if [ $inactive_status -ge 1 ]; then
        echo "starting the sms service"
        systemctl restart sms
        if [ $? -eq 0 ]; then
            echo "sms service started successfully"
            break;
        else
            if [ $count -eq 10 ]; then
                echo "Issue with the sms server in host `hostname`" | mail -s "sms Issue on `hostname`"
                break;
            fi
        fi
    else
        echo "sms is already running....exiting\!\! "
        break;
    fi
    count=$((count+1))
done

