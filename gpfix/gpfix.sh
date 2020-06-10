#!/bin/bash

adapter="PANGP Virtual Ethernet Adapter"

index=$(./ip-utils "${adapter}" index)
ip=$(./ip-utils "${adapter}" ip)

echo $adapter
echo $index;
echo $ip;

#route change 0.0.0.0 mask 0.0.0.0 $ip metric 1000 if $index

route change 172.16.2.0 mask 255.255.255.0 $ip metric 1000 if $index
route change 172.16.2.255 mask 255.255.255.255 $ip metric 1000 if $index

#route change 192.168.1.0 mask 255.255.255.0 $ip metric 1000 if $index
#route change 192.168.1.255 mask 255.255.255.255 $ip metric 1000 if $index

#route add 192.168.1.0 mask 255.255.255.0 172.16.2.2 metric 1
#route add 192.168.1.255 mask 255.255.255.255 172.16.2.2 metric 1