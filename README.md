# Check the stability of your connection

This project allows to monitor the stability of your connection, it requires:

1. A Linux machine always on, used as **monitoring PC**. A Raspberry Pi seems a wonderfull solution.
1. A machine with Python 3.6+ install.

The latter can be the Raspberry Pi itself but a more powerfull machine maybe more convenient.

## Monitorin Setup

### Install script

Copy the  [publicIP.sh] script on the *moniting PC* and **edit** the location where the log 
file is created according the specific setup. Because the script will be execute by **crontab**
job scheduler it is suggested to specify the location of the log as absolute path.

### Schedule the monitoring job

Add the script to **crontab**. The script can be scheduled as preferred, the following
example schedules the script, copied in the `$HOME/bin` directory, to run every 10 minutes:

```sh
*/10 * * * * /home/osmc/bin/publicIP.sh
```

## Analysis

The 