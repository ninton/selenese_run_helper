#!/bin/sh

wget https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar  --output-document=selenium-server-standalone.jar

wget https://github.com/vmi/selenese-runner-java/releases/download/selenese-runner-java-3.30.0/selenese-runner.jar

wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz  --output-document=geckodriver.tar.gz
tar xzf geckodriver.tar.gz
