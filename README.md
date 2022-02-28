# firewalla-alarm-exceptions
As of writing firewalla does not support alarm muting based on schedule

This project is created to be able to add and remove alarms exceptions on a scheduled basis

feature request to firewalla:
https://help.firewalla.com/hc/en-us/community/posts/4449588309139-Feature-request-Mute-alarm-notifications-based-on-schedule?page=1

Scenario:
I would like to set schedules based on times/dates when I do or do not want alarms to fire.
e.g. when a user of my network has gaming activity during 9am to 9pm I do not get an alarm.
However, during 9pm to 9am, if there is gaming activity I would like to receive an alarm/notification

inspired by (thank you):
https://github.com/my-given-name-is-jeremy/FirewallaForHASS
https://help.firewalla.com/hc/en-us/community/posts/360052094213-SSH-Command-to-Enable-Disable-Device-Filtering

cron instructions:
https://help.firewalla.com/hc/en-us/articles/360054056754-Customized-Scripting-

configuration guide
update cron in config/user_crontab to specify time to create and delete exceptions 
update file in config/config.txt to specify content of exception

installation guide
place files in post_main.d folder into folder /home/pi/.firewalla/config/post_main.d
reboot firewalla
update config as above
reboot firewalla
