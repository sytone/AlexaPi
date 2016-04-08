#! /bin/bash

### BEGIN INIT INFO
# Provides:          alexa
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: alexa
### END INIT INFO

exec > /var/log/alexa.log 2>&1 
case "$1" in

start)
    echo "Starting Alexa..."
    python /root/AlexaPi/main.py &

;;

stop)
    echo "Stopping Alexa.."
    pkill -SIGINT ^main.py$
;;

restart|force-reload)
        echo "Restarting Alexa.."
        $0 stop
        sleep 2
        $0 start
        echo "Restarted."
;;
*)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac
