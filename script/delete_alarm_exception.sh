
logd() {
  echo "$(date +%FT%X)" "$1"  >> /home/pi/logs/alarm_exceptions.log
}

logd "Starting delete_alarm_exception.sh"

#TODO check version of firewalla
#maybe here: curl http://127.0.0.1:8834/v1/system/info
#TODO log version
#TODO if version updated send alert to check if scripts are working

exceptions_file="/home/pi/run/firewalla-alarm-exceptions/out/createdEids.txt"

if [ ! -f "$exceptions_file" ]
then
  logd "Exceptions file [$exceptions_file] does not exist, exiting"
  logd "Finished delete_alarm_exception.sh"
  exit 0
fi

while IFS= read -r line
do
	logd "Attempting to delete exception: [$line]"
  RESPONSE=$(curl -s -X POST "http://127.0.0.1:8834/v1/exception/delete?id=$line")
  logd "Response [$RESPONSE]"

done <"$exceptions_file"

rm $exceptions_file


logd "Finished delete_alarm_exception.sh"
