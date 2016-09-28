#!/bin/bash

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

bin/hiveserver2
