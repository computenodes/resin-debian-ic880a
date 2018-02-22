#!/bin/sh
modprobe rtc-ds1307
if [[ $? != 0 ]]
then
    echo "ERROR: modprobe failed"
fi

echo ds1307 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
if [[ $? != 0 ]]
then
    echo "ERROR: rtc setup failed"
fi

hwclock -s
if [[ $? != 0 ]]
then
    echo "ERROR: read time from HWclock failed"
fi
