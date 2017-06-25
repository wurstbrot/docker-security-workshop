#/bin/bash

cd r2d2
./generateBootstrap.sh; vagrant destroy -f && vagrant up &
cd ..


cd luke
./generateBootstrap.sh && vagrant destroy -f && vagrant up &
cd ..

cd kernel-exploits/anakin
./generateBootstrap.sh && vagrant destroy -f && vagrant up &

cd ../qui-gon
./generateBootstrap.sh && vagrant destroy -f && vagrant up 
cd ../..

cd darth
./generateBootstrap.sh && vagrant destroy -f && vagrant up 
cd ..

#leia depends on dart0 and qui-gon
cd leia
./generateBootstrap.sh && vagrant destroy -f && vagrant up
cd ..

