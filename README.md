# Check the stability of your connection

This project allows to monitor the stability of your connection, it requires:

1. A Linux machine always on, used as **monitoring PC**. A Raspberry Pi seems a wonderfull solution.
1. A machine with Python 3.6+ install.

The latter can be the Raspberry Pi itself but a more powerfull machine can be also used.

## Monitoring script

### Monitoring setup on Linux

Copy the [publicIP.sh](publicIP.sh) script on the *monitoring PC*.
Add the script to **crontab**. The script can be scheduled as preferred, the following
example schedules the script, copied in the `$HOME/bin` directory, to run every 10 minutes:

```sh
*/10 * * * * /home/osmc/bin/publicIP.sh fullpath.log
```

A full path for the script and the physical file, where the information is stored,
are reauired, because by default **crontab** doesn't common environment
variables.

### Monitoring setup on Windows

Copy the [publicIP.ps1](publicIP.ps1) script on the *monitoring PC*.
Add the script to the Windows task scheduler, following the guided
procedure.
While adding the script note how the executable that the task runs
is actually the **powershell.exe**, while **the script and the output path**
are optional arguments.

To obtain the full path of the powershell program, opening a powershell
window you can run:

```PS
PS> $(Get-Command powershell).Source
C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe
```

### Monitoring with a Python script

The skeleton for a more advanced option is the python script
[publicIP.py](publicIP.py). The script requires a single argument:
the full path of the output file:

```python
python publicIP.py outfile.log
```

Using python, in case of error a reacher output can be written, the current
version is however quite limited.

## Analysis idea

The log file allows to monitor relevant information at a fixed frequency. The current
script allows to monitor the public IP, this usually changes when the modem has to reconnect
to the network for every reason. The simpest analysis that I propose is to monitor how
often the IP of your network changes, e.g. measuring how often per hour the IP has changed over
time.

This represent a first probe of the network stability and can be used as documentation
of an existing problem. The analysis is showed in the [analysis notebook](analysis.ipynb).

The current version of the analysis is based on the output of the bash script, but the
other data collection script will produce the same ouptut. The notebook performs the following
steps:

1. read the data from the CSV, creating a DataFrame with two columne: Time, IP;
1. convert the timestep in datetime object and use the colum as index;
1. create a numeric version of the IP to simplify to avoid some issues with strings;
1. use a rolling window function, with window size 2, to check if the IP
change in two consecutive test of the public IP. The result of the step
generates a time series.
1. resample the time series, counting the amount of time the IP changed
during the refere time span, 1 hour in the example analysis;
1. reuse the time series two extract how long the same IP was kept, producing
histogram on how long a connection remain active, allowing to mesaure the
average time the connection is stable.
