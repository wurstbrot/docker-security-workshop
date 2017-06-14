#!/bin/bash

# default timeout is 60sec
export TIMEOUT=${TIMEOUT:-60}
TIMEOUT2=$((TIMEOUT - 1))

export green='\e[0;32m'
export yellow='\e[0;33m'
export red='\e[0;31m'
export blue='\e[0;34m'
export endColor='\e[0m'



#export NETBOMB=${NETBOMB:-"iperf -c 192.168.33.2 -t ${TIMEOUT2} -i 1 -p 5201 -u -b 10240000000"}
smokeGrenade() {
  echo -e "${red}Smoke Grenade - duration ${TIMEOUT}s${endColor}"
  /smokeGrenade
}
export -f smokeGrenade

fragmentationGrenade() {
	echo -e "${red}Fragmentation Grenade - duration ${TIMEOUT}s${endColor}"
	# 1000MB file
	while [ true ]; do
		dd if=/dev/zero of=/tmp/testfile bs=1024 count=10240000  > /dev/null
	done	
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
  if [ ! -e /tmp/testfile ]; then
	dd if=/dev/zero of=/tmp/testfile bs=1024 count=10240 > /dev/null 
  fi
  mkdir .ssh
  echo "
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA46kqt7k0/299KXaeJlcryV3fPRu+3JbPo7RVpEUWYy+qjN8k
/sqHJnhR4For/jqyEBo4PSha76ayMiKpn2EaqvDls88hha+2Veq0nNy62OI4/fZC
TIjdqEdbV7Vm4iTBrDCF48HxkH1EwGA4bfBBKNXYMLrrJco8uel+/1JyjXJaWE9l
w2buNvtbOaP0MQBR+jLC1lEgVp/KnhFYxrjIqqgCMivkpxLfZ/vVBA5VxRGe54ii
njS5oRQt6+nDWCD5s5Z0ceaE2UTtzvVkBOVhDPBCHKZr5KlSxCXPQQKD7b5xfYOr
DsALgJEf9vmpWkL0LVXh5wwWZuGE4x67otwIwwIDAQABAoIBACNXmbgX2nBlIGsV
bQvKsJN8LTHRYtnf17A0SK9NwmH3fmSMJ7QeQMjqGNvZY8b92bLCP0TPRP67RCKg
WvDRJFCxQRee6jdUxdukqhFH+wG8bNiQKE61WKPNIBMHqEcnKaHPjpmC/DtQFyI+
TcRTbeom+H7oJaUiNjcuVnbQl9P5R7QgstrkwYNRVnBIdR/HAv55171uwmvWPncf
Ho62ljwoh9LJfxYj0Q7ayU4r1HBXzCCnhdhT5FPjL+jHe+jNhRbJXPbqbMiJIvCn
wFIa8pwqPyD+y4WyfcAwbNcNICMy/pNMvmEsPlhx4b5ogrQ9/GgmTsmzJONGM/QH
GfZHv5ECgYEA8vJzddHsS+0vMnfpSOhoOriDsEu0E6mmIavnx3ly6cDMn0oDnAPY
0/UrXSsBbZHGS7eQmPs+Fj86gW7QYquVrdNuZ03H5UxWnCTyZpPWwft/56TTm3V4
+yerQpgDUQNmZ3kHsoR+OJ2CljWX4VlN/7kdo2E9+Lgc8H0CLD0qMhUCgYEA7+R3
EAKZXzQ8va0S2i4R2zuF87X7Aj5YdqM2wrl96IG3dImdcShpnxVQyo6XleprKx4p
sfmtzWibIC9p4RgzyPlobCV+Zeeq8qguv2Uy8AMTK6KZ4mNC+ePicX+HzLLOwoyt
2bF+k9At743kzEMqlZbTK1lR83M07E9JwG3A/XcCgYBhgIhyGqPY/QHaIWHQzuU1
2+OOF3PYCFgSX2mQFt/VjHkS3KOCM9ELj/OtWpsiHEUXEj7IBt0uFIYoeA7N6ssR
ji9a6k51aiPAWtul62NfSs5Ua0Q5ufWp5ovHGDcMhm7MzDgYnzABDMXh/vRLjonN
Pb/1WAuFDG8g3SrIEmwi2QKBgF9PUBamUbVHldJuTw0sPJ/zuDap2L59crxAAGPB
OssDrpW4jzsEKWKxH1Y67PL9HfMVms9BOdJgezGAZPqvmPOCVACTrPJj5sFeHKSi
WmiNcDJn+ee+NEAAUFlzp8qmSAt3xSK2qGmlznpcz8hv7x1bvS594FdvMFmq7sxr
Tr/lAoGARK7pe9j6udBj0zwWaa5ycC7XJxtdwbez5D3RfD0jaLOELKWTcxKJFpDD
iZRyXmMeJFCeAAu2+nVnjvDdhCyZNQzXS6kZJjOIIvZH+NB7z673HBfGWFarQoH3
yc+EojBY1Nlc+kJl9DxD8BXmpbHEjK+vj7Yg8jHx36VtUBj+yEE=
-----END RSA PRIVATE KEY-----
" > $HOME/.ssh/id_rsa
  chmod 400 $HOME/.ssh/id_rsa
  while [ true ]; do
	scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /tmp/testfile ubuntu@darth:/tmp
  done
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
