#!/bin/sh
while true
do
    ethernet_dir="/sys/class/net/enp*"
    wifi_dir="/sys/class/net/wlp*"
    ethernet_state=""
    wifi_state=""
    result=""
    if [ -d $ethernet_dir ]; then
        ethernet_state=`cat $ethernet_dir/operstate`
    fi
    if [ -d $wifi_dir ]; then
        wifi_state=`cat $wifi_dir/operstate`
    fi
    if [ "$ethernet_state" == "up"  ]; then
        #echo ethernet up
        result=`echo $ethernet_dir | awk -F '/' '{print $5}'`
    elif [ "$wifi_state" == "up" ]; then
        #echo wifi up
        result=`echo $wifi_dir | awk -F '/' '{print $5}'`
    else
        echo No Connection
        sleep 1
        continue
    fi
    
    for i in {1..10}
    do
        R1=`cat /sys/class/net/$result/statistics/rx_bytes`
        T1=`cat /sys/class/net/$result/statistics/tx_bytes`
        sleep 1
        R2=`cat /sys/class/net/$result/statistics/rx_bytes`
        T2=`cat /sys/class/net/$result/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TKBPS=`expr $TBPS / 1024`
        RKBPS=`expr $RBPS / 1024`
        echo " $RKBPS  $TKBPS"
    done
done
