#!/bin/bash

function exitOnFailure() {
	if [ $? -ne 0 ]; then
		echo "Error while $1..."
		echo "Exitting..."
		exit
	fi
}

echo "Enter the interface name for which you wanna enable monitor mode..."
read interfaceName
echo "***********************************************************************************************************"
echo "Bringing the interface down..."
ifconfig $interfaceName down
exitOnFailure "bringing interface down"
echo "***********************************************************************************************************"
echo "Killling processes (if needed)..."
airmon-ng check kill
echo "***********************************************************************************************************"
echo "Setting interface $interfaceName to monitor mode..."
iwconfig $interfaceName mode monitor
exitOnFailure "while setting interface to monitor mode"
echo "***********************************************************************************************************"
echo "Enabling $interfaceName"
ifconfig $interfaceName up
exitOnFailure "while bringing the interface up"
iwconfig
echo "***********************************************************************************************************"
