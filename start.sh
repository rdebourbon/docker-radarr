#!/bin/bash

function handle_signal {
  PID=$!
  echo "received signal. PID is ${PID}"
  kill -s SIGHUP $PID
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

echo "starting radarr"
mono /opt/Radarr/Radarr.exe --no-browser -data=/volumes/config/radarr & wait
echo "stopping radarr"
