#!/bin/bash
USE_IFCONFIG=eth0
HOST_IP=$(ifconfig $USE_IFCONFIG | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}')
app_path=/usr/local/zabbix
sed -i "s/Hostname=.*/Hostname=${HOST_IP}/" "$app_path"/etc/zabbix_agentd.conf
