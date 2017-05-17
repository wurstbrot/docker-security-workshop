#!/bin/bash

# default timeout is 30sec
export TIMEOUT=${TIMEOUT:-30}
TIMEOUT2=$((TIMEOUT - 1))
export NETBOMB=${NETBOMB:-"iperf -c 192.168.33.2 -t ${TIMEOUT2} -i 1 -p 5201 -u -b 10240000000"}

export green='\e[0;32m'
export yellow='\e[0;33m'
export red='\e[0;31m'
export blue='\e[0;34m'
export endColor='\e[0m'

smokeGrenade() {
  echo -e "${red}Smoke Grenade - duration ${TIMEOUT}s${endColor}"
  /smokeGrenade
}
export -f smokeGrenade

fragmentationGrenade() {
	  echo -e "${red}Fragmentation Grenade - duration ${TIMEOUT}s${endColor}"
	  # 1000MB file
	  dd if=/dev/random of=/tmp/testfile bs=1024 count=1024000
}
export -f fragmentationGrenade


flashBangGrenade() {
  echo -e "${red}Flash Bang Grenade - duration ${TIMEOUT}s${endColor}"
  (
    pids=""
    cpus=$(getconf _NPROCESSORS_ONLN)
    trap 'for p in $pids; do kill $p; done' 0
    for ((i=0;i<cpus;i++)); do while : ; do : ; done & pids="$pids $!"; done
    sleep ${TIMEOUT}
  )
}
export -f flashBangGrenade

cryoBanGrenade() {
  echo -e "${red}Cyro Ban Grenade - duration ${TIMEOUT}s${endColor}"
  /cryoBanGrenade
}
export -f cryoBanGrenade

thermalDetonator() {
  echo -e "${red}thermalDetonator - duration ${TIMEOUT}s${endColor}"
  eval $NETBOMB
}
export -f thermalDetonator

e-11-blaster() {
  echo -e "${red}e-11-blaser${endColor}"
  exit 1
}
export -f e-11-blaster

lightsaber() {
  echo -e "${red}lightsaber${endColor}"
  echo c >/proc/sysrq-trigger
}
export -f lightsaber

timeout -t ${TIMEOUT} -s KILL bash -c $@
