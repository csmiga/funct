#! /usr/bin/env bash

: <<'END'
Author:   Christopher Smiga
e-Mail:   CSmiga@yahoo.com
LinkedIn: https://www.linkedin.com/in/csmiga/

File:    nfunct.sh
END

declare NFUNCT_CONF=$HOME/Projects/nfunct/conf/nfunct.conf
#declare NFUNCT_CONF=$HOME/Projects/nfunct_behaviors/plutotv/conf/plutotv.conf
declare NFUNCT_BIN=/root/Projects/venv3/bin/locust
declare NFUNCT_PROC=$(pgrep locust)

function nfunct_start () {
    if [ -z "$NFUNCT_PROC" ]
    then
        local NFUNCT_ARG=$(grep -Ev "^$|#" "$NFUNCT_CONF" | \
            awk -F\, '{print $2 "--" $1}' | awk 'ORS=" "')
        # Debug "nfunct start" using output.
        #$NFUNCT_BIN $NFUNCT_ARG
        # Process monitorng using "nfunct status".
        $NFUNCT_BIN $NFUNCT_ARG 2> /dev/null &
        local NFUNCT_PID=$(pgrep locust)
        echo "nfunct [ PID: $NFUNCT_PID ] starting "
        sleep 1
        if [ -n "$NFUNCT_PID" ]
        then
            echo "nfunct [ PID: $NFUNCT_PID ] started "
        else
            echo "nfunct [ PID: None ] not running "
        fi
    else
        echo "nfunct [ PID: $NFUNCT_PROC ] running "
    fi
}

function nfunct_status () {
    if [ -n "$NFUNCT_PROC" ]
    then
        echo "nfunct [ PID: $NFUNCT_PROC ] running "
    else
        echo "nfunct [ PID: None ] not running "
    fi                       
}

function nfunct_stop () {
    if [ -n "$NFUNCT_PROC" ]
    then
        echo "nfunct [ PID: $NFUNCT_PROC ] stopping"
        kill -SIGTERM "$NFUNCT_PROC"
        sleep 1
        local NFUNCT_PID=$(pgrep locust)
        if [ -z "$NFUNCT_PID" ]
        then
            echo "nfunct [ PID: None ] stopped"
        else
            echo "nfunct [ PID: $NFUNCT_PID ] running "
        fi
    else
        echo "nfunct [ PID: None ] not running "
    fi
}

case "$1" in
    help)
        echo
        echo "Binary: $($NFUNCT_BIN --version)"
        echo "Config: $(echo $NFUNCT_CONF)"
        echo
        echo "Reading config file..."
        echo
        cat $NFUNCT_CONF
        ;;
    list)
        $NFUNCT_BIN --list --locustfile $(awk '/^locustfile/ {print $2}' $NFUNCT_CONF)
        ;;
    start)
        nfunct_start
        ;;
    stop)
        nfunct_stop
        ;;
    status)
        nfunct_status
        ;;
    version)
        $NFUNCT_BIN --version
        ;;

    *)
        echo $"Usage: $0 {start|stop|status|list|version|help}"
        exit 1
esac

exit 0
