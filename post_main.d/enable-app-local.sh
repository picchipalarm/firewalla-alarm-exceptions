#!/bin/bash

sed -i 's/!firewalla.isProductionOrBeta()/true/g' /home/pi/firewalla/api/app-local.js

sudo systemctl restart fireapi
