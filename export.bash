#!/bin/bash

NAMES=(anakin leia luke qui-gon darth )
for host in "${NAMES[@]}";do
	        rm /media/tpagel/windows-data/$host.ova
	        vboxmanage export $host --output /media/tpagel/windows-data/$host.ova
done

