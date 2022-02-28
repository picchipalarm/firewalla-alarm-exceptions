
logd() {
  echo "$(date +%FT%X)" "$1"  >> /home/pi/logs/alarm_exceptions.log
}

logd "Starting create_alarm_exception.sh"

#TODO check version of firewalla
#maybe here: curl http://127.0.0.1:8834/v1/system/info
#TODO log version
#TODO if version updated send alert to check if scripts are working

exceptions_folder="/home/pi/run/firewalla-alarm-exceptions/out"
mkdir -p /home/pi/run/firewalla-alarm-exceptions/out

file="/home/pi/run/firewalla-alarm-exceptions/config/config.txt"
while IFS= read -r line
do

	logd "Attempting to create exception for config: [$line]"
  RESPONSE=$(curl -s -X POST -d "$line" http://127.0.0.1:8834/v1/exception/create)
  logd "Response [$RESPONSE]"
  EID=$(echo "$RESPONSE" | jq -r .exceptionID.eid)
  echo "$EID" >> $exceptions_folder/createdEids.txt

done <"$file"

logd "Finished create_alarm_exception.sh"
