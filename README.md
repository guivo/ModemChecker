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

## Analysis idea

The log file allows to monitor relevant information at a fixed frequency. The current
script allows to monitor the public IP, this usually changes when the modem has to reconnect
to the network for every reason. The simpest analysis that I propose is to monitor how
often the IP of your network changes, e.g. measuring how often per hour the IP has changed over
time.

This represent a first probe of the network stability and can be used as documentation
of an existing problem. The analysis is showed here in the [analysis.ipynb]
