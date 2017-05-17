#/bin/bash

cd luke
./generateBootstrap.sh && vagrant destroy -f && vagrant up &
cd ..

cd kernel-exploits/anakin
./generateBootstrap.sh && vagrant destroy -f && vagrant up &

cd ../qui-gon
./generateBootstrap.sh && vagrant destroy -f && vagrant up &
cd ../..

cd darth
./generateBootstrap.sh && vagrant destroy -f && vagrant up &
cd ..

#leia depends on darth
cd leia
./generateBootstrap.sh && vagrant destroy -f && vagrant up
cd ..

