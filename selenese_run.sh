#!/bin/bash -ue

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! -f $SCRIPT_DIR/geckodriver ]; then
  echo "not found: $SCRIPT_DIR/geckodriver"
fi

if [ ! -f $SCRIPT_DIR/selenese-runner.jar ]; then
  echo "not found: $SCRIPT_DIR/selenese-runner.jar"
fi

if [ ! -f $SCRIPT_DIR/firefox.sh ]; then
  echo "not found: $SCRIPT_DIR/firefox.sh"
fi

if [ "$1" == "" ]; then
  echo $(basename $0) selenese.html
fi

# http://commons.apache.org/proper/commons-lang/download_lang.cgi
# http://ftp.meisei-u.ac.jp/mirror/apache/dist//commons/lang/binaries/commons-lang3-3.5-bin.tar.gz
# cp commons-lang3-3.5*.jar /usr/lib/jvm/java-8-oracle/jre/lib/ext/

java \
  -Dwebdriver.gecko.driver=$SCRIPT_DIR/geckodriver \
  -jar $SCRIPT_DIR/selenese-runner.jar             \
  --firefox $SCRIPT_DIR/firefox.sh                 \
  --xml-result testResults/                        \
  $1
