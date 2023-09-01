#!/bin/bash

function exitOnFailure() {
	if [ $? -ne 0 ]; then
		echo "Error while $1..."
		echo "Exitting..."
		exit
	fi
}