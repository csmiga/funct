#! /usr/bin/env bash

: <<'END'
Author:   Christopher Smiga
e-Mail:   CSmiga@yahoo.com
LinkedIn: https://www.linkedin.com/in/csmiga/

File:    funct.sh
END

declare FUNCT_CONF=$HOME/Projects/funct/conf/funct.conf
declare FUNCT_BIN=/root/Projects/venv3/bin/behave
declare FUNCT_PROC=$(pgrep behave)

function funct_start () {
    if [ -z "$FUNCT_PROC" ]
    then
        local FUNCT_ARG=$(grep -Ev "^$|#" "$FUNCT_CONF" | \
            awk -F\, '{print $2 "--" $1}' | awk 'ORS=" "')
        $FUNCT_BIN $FUNCT_ARG
        local FUNCT_PID=$(pgrep behave)
        echo "funct [ PID: $FUNCT_PID ] starting "
        sleep 1
        if [ -n "$FUNCT_PID" ]
        then
            echo "funct [ PID: $FUNCT_PID ] started "
        else
            echo "funct [ PID: None ] not running "
        fi
    else
        echo "funct [ PID: $FUNCT_PROC ] running "
    fi
}

function funct_status () {
    if [ -n "$FUNCT_PROC" ]
    then
        echo "funct [ PID: $FUNCT_PROC ] running "
    else
        echo "funct [ PID: None ] not running "
    fi                       
}

function funct_stop () {
    if [ -n "$FUNCT_PROC" ]
    then
        echo "funct [ PID: $FUNCT_PROC ] stopping"
        kill -SIGTERM "$FUNCT_PROC"
        sleep 1
        local FUNCT_PID=$(pgrep behave)
        if [ -z "$FUNCT_PID" ]
        then
            echo "funct [ PID: None ] stopped"
        else
            echo "funct [ PID: $FUNCT_PID ] running "
        fi
    else
        echo "funct [ PID: None ] not running "
    fi
}

case "$1" in
    help)
        echo
        echo "Binary: $($FUNCT_BIN --version)"
        echo "Config: $(echo $FUNCT_CONF)"
        echo
        echo "Reading config file..."
        echo
        cat $FUNCT_CONF
        ;;
    start)
        funct_start $2
        ;;
    stop)
        funct_stop
        ;;
    status)
        funct_status
        ;;
    version)
        $FUNCT_BIN --version
        ;;

    *)
        echo "Usage: $0 {start|stop|status|version|help}"
        echo 
        exit 1
esac

exit 0
