#!/bin/bash

#logfile at regular intervals with timestamp 
logfile=/var/log/sysmonitor.log

log(){

    local message = $1
    echo "$message - $(date + '%T')" >> $logfile
}


#Monitor system metrics 
CPU_metrics(){
   local cpu_usage=$(top -bn1 | grep "CPU(s)" | awk '{print $1 + $2 + $3}')
   echo "Cpu usage is $cpu_usage"
   log "Cpu usage is $cpu_usage"

}


Memory_metrics(){
    local Mem_usage=$(free -m | awk '/Mem:/ {print ($3 / $2) * 100.00}')
   echo "Cpu usage is $Mem_usage"
   log "Cpu usage is $Mem_usage"
}

disk_usage_metrics(){
    local disk_usage=$(df -h --total | grep ^total | awk '{print $5}' | sed 's/%//')
    echo "Disk Usage is $disk_usage"
    log "Disk Usage is $disk_usage"
}


dskusage=$(disk_usage_metrics)
memusage=$(Memory_metrics)
cpuUsage=$(CPU_metrics)

#Define limits and if it exceeds, send alert mail 
 CPU_threshold=90
 Mem_threshold=85
 Disk_threshold=75 

if [ $dskusage -gt $Disk_threshold ]
then 
    echo "Disk limt exceeded!!!" 1>>$logfile
    mail -s "Disk Limit Alert" email@address.com <<< "Disk usage has exceeded Limit. Kindly review"
fi 

if [ $memusage -gt $Mem_threshold ]
then 
    echo "Memory limit exceeded!!!" 1>>$logfile
    mail -s "Memory Limit Alert" email@address.com <<< "Memory usage has exceeded Limit. Kindly review"
fi 

if [ $cpuUsage -gt $Mem_threshold ]
then 
    echo "CPU limit exceeded!!!" 1>>$logfile
    mail -s "CPU Limit Alert" email@address.com <<< "CPU usage has exceeded Limit. Kindly review"
fi 


#schedule Jobs with cron every 4hrs 
cron_job="0 4 * * * /path/to/your/script/monitor.sh 1>>$logfile"
(crontab -l | grep -v -F "$cron_job"; echo "$cron_job") | crontab -


