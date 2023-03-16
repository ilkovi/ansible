#!/bin/bash

declare -A time_zone

DIR="/usr/share/zoneinfo"

time_zone=([${DIR}/Europe/Kaliningrad]=3
[${DIR}/Europe/Moscow]=4
[${DIR}/Europe/Volgograd]=4
[${DIR}/Europe/Samara]=4
[${DIR}/Asia/Yekaterinburg]=6
[${DIR}/Asia/Omsk]=7
[${DIR}/Asia/Novosibirsk]=7
[${DIR}/Asia/Novokuznetsk]=7
[${DIR}/Asia/Krasnoyarsk]=8
[${DIR}/Asia/Irkutsk]=9
[${DIR}/Asia/Yakutsk]=10
[${DIR}/Asia/Vladivostok]=11
[${DIR}/Asia/Sakhalin]=11
[${DIR}/Asia/Magadan]=12
[${DIR}/Asia/Kamchatka]=12
[${DIR}/Asia/Anadyr]=12)

if [ ! -e /etc/localtime ]
then
        LOCAL=
else
        LOCAL="`ls -al /etc/localtime | awk '{print $11}'`"
        echo "Current TZ is $LOCAL . Current UTP offset must be :  ${time_zone[${LOCAL}]} hours"
fi

OFFSET=`tail -n 1 ../Europe/Moscow | sed -e 's/[^[[:digit:]]]*//g'`


#for zone in $ALL_ZONE
#do

#echo
#echo "------ $zone "
#tail -n 1 $DIR/$zone && `echo date +%Z`

#done
