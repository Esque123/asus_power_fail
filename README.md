A script that will will shutdown a ASUS G551JW laptop safely on power failure or loss of AC power. Only tested on a ASUS laptop

I created this because even though Linux has the built in function to shutdown the laptop when the power fails, in power options. The problem is that when my batery dies before it even notifies Linux that it is critical. This is because the battery is worn out. 
With this, I am able to log power failures and also shutdown my pc safely even with a mostly dead battery.

It is used in conjunction with 80-power.rules located in /etc/udev/rules.d/ and power_fail.sh that you put in /home/user/bin.

Steps:

Place 80-power.rules etc/udev/rules.d

Place power_fail.sh in /home/user/bin

In terminal:
1) Make use of "udevadm monitor" command to identify the event and action when you disconnect your laptop from AC.
2) Type "sudo udevadm control -- reload" to refreah udev
3) Use "sudo udevadm info --path=/sys/class/power_supply/BAT0" to ID Battery ENV (Enviromentals)
4) Use "sudo udevadm info --path=/sys/class/power_supply/AC0" to ID the AC ENV (Enviromentals)
5) Use "udevadm test --action="change" /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/PNP0C0A:00/power_supply/BAT0" to run a simulation and test the script.


