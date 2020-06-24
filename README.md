# Check the stability of your connection

This project allows to monitor the stability of your connection, it requires:

1. A Linux machine always on, used as **monitoring PC**. A Raspberry Pi seems a wonderfull solution.
1. A machine with Python 3.6+ install.

The latter can be the Raspberry Pi itself but a more powerfull machine maybe more convenient.

## Monitoring setup on Linux

Copy the [publicIP.sh](publicIP.sh) script on the *monitoring PC*.
Add the script to **crontab**. The script can be scheduled as preferred, the following
example schedules the script, copied in the `$HOME/bin` directory, to run every 10 minutes:

```sh
*/10 * * * * /home/osmc/bin/publicIP.sh fullpath.log
```

A full path for the script and the physical file, where the information is stored,
are reauired, because by default **crontab** doesn't common environment
variables.

## Monitoring setup on Windows

Copy the [publicIP.ps1](publicIP.ps1) script on the *monitoring PC*.
Add the script to the Windows task scheduler, following the instruction.
While adding the script note how the task to run is actually the
**powershell.exe**, while **the script and the output path** are
optional arguments.

To obtain the full path of the powershell program, opening a powershell
window you can run:

```PS
PS> $(Get-Command powershell).Source
C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe
```

## Analysis idea

The log file allows to monitor relevant information at a fixed frequency. The current
script allows to monitor the public IP, this usually changes when the modem has to reconnect
to the network for every reason. The simpest analysis that I propose is to monitor how
often the IP of your network changes, e.g. measuring how often per hour the IP has changed over
time.

This represent a first probe of the network stability and can be used as documentation
of an existing problem. The analysis is showed in the [analysis notebook](analysis.ipynb).
