#! /usr/bin/env bash

: <<'END'
Author:   Christopher Smiga
e-Mail:   CSmiga@yahoo.com
LinkedIn: https://www.linkedin.com/in/csmiga/

File:    funct.sh
END

declare CONFIG=$HOME/Projects/funct/conf/funct.conf
declare BEHAVIOR=/root/Projects/funct/lib/features/
declare BIN=/root/Projects/venv3/bin/behave
declare PROCESS=$(pgrep behave)

function funct_start () {
    if [ -z "$PROCESS" ]
    then
        local OPTION=$(grep -Ev "^$|#" "$CONFIG" | \
            awk -F\, '{print $2 "--" $1}' | awk 'ORS=" "')
        $BIN $OPTION $BEHAVIOR 2> /dev/null &
        local PID=$(pgrep behave)
        echo "funct [ PID: $PID ] starting "
        sleep 1
        if [ -n "$PID" ]
        then
            echo "funct [ PID: $PID ] started "
        else
            echo "funct [ PID: None ] not running "
        fi
    else
        echo "funct [ PID: $PROCESS ] running "
    fi
}

function funct_status () {
    if [ -n "$PROCESS" ]
    then
        echo "funct [ PID: $PROCESS ] running "
    else
        echo "funct [ PID: None ] not running "
    fi                       
}

function funct_stop () {
    if [ -n "$PROCESS" ]
    then
        echo "funct [ PID: $PROCESS ] stopping"
        kill -SIGTERM "$PROCESS"
        sleep 1
        local PID=$(pgrep behave)
        if [ -z "$PID" ]
        then
            echo "funct [ PID: None ] stopped"
        else
            echo "funct [ PID: $PID ] running "
        fi
    else
        echo "funct [ PID: None ] not running "
    fi
}

case "$1" in
    help)
        echo
        echo "Binary: $($BIN --version)"
        echo "Config: $(echo $CONFIG)"
        echo
        echo "Reading config file..."
        echo
        cat $CONFIG
        ;;
    start)
        funct_start
        ;;
    stop)
        funct_stop
        ;;
    status)
        funct_status
        ;;
    version)
        $BIN --version
        ;;

    *)
        echo "Usage: $0 {start|stop|status|version|help}"
        echo 
        exit 1
esac

exit 0
