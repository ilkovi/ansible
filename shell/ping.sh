#!/bin/bash
my_net=10.100.244.
for i in `seq 2 126`;
do
  ip="$my_net$i"
if ping -c 2 -i 0.1 $ip >/dev/null 2>&1
then
    echo "$ip address allocated" >&2
else
    echo "$ip address FREE" >&2
fi
done