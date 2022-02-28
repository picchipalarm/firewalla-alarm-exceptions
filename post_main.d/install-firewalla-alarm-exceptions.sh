#!/bin/bash

FIREWALLA_ALARM_EXCEPTIONS_FOLDER="/home/pi/run/firewalla-alarm-exceptions"

logd() {
  echo "$(date +%FT%X)" "$1"  >> /home/pi/logs/alarm_exceptions.log
}

logd "Starting install-firewalla-alarm-exceptions"

if [ -d "$FIREWALLA_ALARM_EXCEPTIONS_FOLDER" ]
then
  logd "Directory $FIREWALLA_ALARM_EXCEPTIONS_FOLDER exists, pulling latest."
  git -C $FIREWALLA_ALARM_EXCEPTIONS_FOLDER pull
else
  logd "Directory $FIREWALLA_ALARM_EXCEPTIONS_FOLDER does not exists, cloning."
  mkdir -p $FIREWALLA_ALARM_EXCEPTIONS_FOLDER
  git clone https://github.com/picchipalarm/firewalla-alarm-exceptions.git $FIREWALLA_ALARM_EXCEPTIONS_FOLDER
fi

logd "Installing new crontab"
touch /home/pi/.firewalla/config/user_crontab
cp $FIREWALLA_ALARM_EXCEPTIONS_FOLDER/config/user_crontab /home/pi/.firewalla/config/user_crontab

logd "Finished install-firewalla-alarm-exceptions"
