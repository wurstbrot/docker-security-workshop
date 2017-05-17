#!/bin/bash

function checkStatus {
	if [ "$1" != "0" ]; then
		echo "Netzwerk ist nicht korrekt eingerichtet";
		exit 1;
	fi
}

ping -c 1 luke
checkStatus $?
ping -c 1 darth
checkStatus $?
ping -c 1 anakin
checkStatus $?
ping -c 1 qui-gon
checkStatus $?
