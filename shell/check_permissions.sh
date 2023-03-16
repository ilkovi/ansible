#!/bin/bash

VG_LIST=`lsvg | grep datavg | tr '\n' ' '`

for VG in $VG_LIST; do

  VGSERIAL_ID=`odmget -q "attribute=vgserial_id and name=$VG" CuAt | grep value | awk '{print $NF}' | tr -d '"'`

  DEV_LIST=`odmget -q "attribute=lvserial_id and value like $VGSERIAL_ID*" CuAt|grep name  | awk '{print $NF}' | tr '\n' ' ' | tr -d
'"'`

  for DEV in $DEV_LIST; do
        TEST_Perm=`stat -c '%a:%U:%G' /dev/$DEV `

        if [ ! "$TEST_Perm" == "660:oracle8:dba" ]
        then
          echo "$DEV permissions and owner FAIL"
        else
          echo "$DEV permissions and owner OK"
        fi
  done

done
