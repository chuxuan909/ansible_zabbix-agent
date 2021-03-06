#!/bin/bash
# DateTime: 2017-12-13
# Description：zabbix监控nginx性能以及进程状态
# Note：此脚本需要配置在被监控端，否则ping检测将会得到不符合预期的结果
 
HOST="127.0.0.1"
PORT="9088"
URI="/iZbp19jppbw4pm4e0abn36Z_status"
 
# 检测nginx进程是否存在
function ping {
    /sbin/pidof nginx | wc -l 
}
# 检测nginx性能
function active {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| grep 'Active' | awk '{print $NF}'
}
function reading {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| grep 'Reading' | awk '{print $2}'
}
function writing {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| grep 'Writing' | awk '{print $4}'
}
function waiting {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| grep 'Waiting' | awk '{print $6}'
}
function accepts {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| awk NR==3 | awk '{print $1}'
}
function handled {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| awk NR==3 | awk '{print $2}'
}
function requests {
    /usr/bin/curl "http://$HOST:$PORT/${URI}" 2>/dev/null| awk NR==3 | awk '{print $3}'
}

# 执行function
$1
