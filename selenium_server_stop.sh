#!/bin/bash -ux

SCRIPT_DIR=$(cd $(dirname $0); pwd)
selenium_server_standalone_jar=$SCRIPT_DIR/selenium-server-standalone.jar

if [ ! -f $selenium_server_standalone_jar ]; then
  echo "not found: $selenium_server_standalone_jar"
fi

pkill -f  $selenium_server_standalone_jar
pgrep -f  $selenium_server_standalone_jar
sleep 5
exit 0
