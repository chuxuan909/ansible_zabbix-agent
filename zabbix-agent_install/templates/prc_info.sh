#!/bin/bash
#author chenjei Email:305958872@qq.com
#version 1.0.0  Date 2017-12-12
#获取各个进程的内存和CPU状态脚本
if [[ $# == 1 ]]
 then
result=$(/bin/ps -e -o 'pid,comm,pcpu,rsz,vsz,args'|grep -v grep|grep "$1"|wc -l)
echo $(( $result-2 ))
fi
if [[ $# == 2 ]];then
case $2 in
 mem)   
/bin/ps -e -o 'pid,comm,pcpu,rsz,vsz,args'|grep -v grep|grep "$1"|awk '{sum+=$4}END{print sum}'
 ;;
 pcpu)
/bin/ps -e -o 'pid,comm,pcpu,rsz,vsz,args'|grep -v grep|grep "$1"|awk '{sum+=$3}END{print sum}'
 ;;
 *)
echo "Usage:$0{mem|php|db0 avg_ttl}"
        ;;
esac
fi
