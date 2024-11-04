# Automated-System-Monitoring-

## Automated System Monitoring Tool for Linux

This tool is designed to automatically monitor CPU, memory, and disk usage on a Linux system. It logs system metrics at regular intervals and sends email alerts if any of these metrics cross predefined thresholds. 

## Features
- **CPU Usage Monitoring**: Monitors and logs the percentage of CPU usage.
- **Memory Usage Monitoring**: Monitors and logs memory utilization as a percentage.
- **Disk Usage Monitoring**: Monitors and logs total disk usage.
- **Alert Notifications**: Sends email notifications when usage thresholds are exceeded.
- **Scheduled Execution**: The script runs every 4 hours via cron job.

## Getting Started

### Prerequisites
- **Linux system** with Bash shell.
- **`mail` utility** for sending email alerts (install with `sudo apt-get install mailutils` on Ubuntu).
- **AWS CLI** (if you plan to use cloud storage for logs).
  
### Installation
1. **Clone the Repository**: Download or clone this project to your Linux system.
   ```bash
   git clone <repository-link>
   cd Automated-System-Monitoring

2. Set Up Email Notifications: Configure mail to work with your email service, updating any necessary settings in /etc/mail.rc for external email providers if needed.

## Configuration  
You can always open the script and change the threshold levels according to your preference. 
- CPU_threshold (default: 90%)
- Mem_threshold (default: 85%)
- Disk_threshold (default: 75%)

You can also update the automated schedule (cronjob)


## Usage 

1. Run the script 
   **./Monitor.sh**

2. Automate with Cron: The script includes a cron job entry to automate execution. It runs every 4 hours by default.

# Script Structure
## Functions:
- log(): Logs messages with timestamps.
- CPU_metrics(): Logs CPU usage and checks threshold.
- Memory_metrics(): Logs memory usage and checks threshold.
- disk_usage_metrics(): Logs disk usage and checks threshold.

## Logs
System metrics are stored in /var/log/sysmonitor.log by default. Timestamps accompany each entry to track the time of each log.


Feel free to contribute or open issues for improvements.