le true; do
    inactive_status=$(systemctl status nginx | grep -c 'inactive' | tail -1)

    if [ $inactive_status -ge 1 ]; then
        echo "starting the nginx service"
        systemctl restart nginx
        if [ $? -eq 0 ]; then
            echo "nginx started successfully"
            break;
        else
            if [ $count -eq 10 ]; then
                echo "Issue with the nginx server in host `hostname`" | mail -s "nginx Issue on `hostname`"
                break;
            fi
        fi
    else
        echo "nginx is already running....exiting\!\! "
        break;
    fi
    count=$((count+1))
done

