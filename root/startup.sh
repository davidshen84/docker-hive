#!/bin/bash

set -m

OPTS=`getopt -o h --long initSchema: -n "$0" -- "$@"`
eval set -- "$OPTS"

while true; do
  case "$1" in
    --initSchema)
      bin/schematool -dbType "$2" -initSchema
      shift 2
      ;;
    -h)
      echo "help!"
      shift
      ;;
    --) shift
        break
        ;;
    *) echo "ERROR!!!"
       exit 1
       ;;
  esac
done

export PATH=$PATH:$HCATALOG_HOME/bin

start() {
  hcatalog/sbin/webhcat_server.sh start
  bin/hiveserver2 &
}

HIVESERVER_PID=
stop() {
  echo "Teardown container!!!"

  kill -SIGTERM $HIVESERVER_PID
  hcatalog/sbin/webhcat_server.sh stop

  exit 0
}

start
trap "stop" SIGTERM exit

HIVESERVER_PID="$!"
wait $HIVESERVER_PID
