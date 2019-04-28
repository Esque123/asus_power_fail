#!/bin/bash
# A script that will will shutdown the laptop safely on power failure. Only tested on a ASUS laptop
# Place this script in /home/yourusername/bin/ or /usr/local/bin/
# It is used in conjunction with 80-power.rules located in /etc/udev/rules.d/
# Kevin
# 23/03/2019

#Enter your real username here
#################################
myname="kevin"
#################################

export DISPLAY=:0
export XAUTHORITY=/home/"$myname"/.Xauthority

#Play a *.wav notification, dialo-question.wav is my own custom sound
/usr/bin/aplay /home/"$myname"/Music/beam.wav
notify-send -u critical "Power Failure ... Shutting down the system in less than 1 min!"	#Cant get this to work for some reason?

#Send a warning notification to X-dsiplay
zenity --warning --title "Power Failure" --text "Shutdown in 1 min. Please save all your work" --timeout=45 2>/dev/null &

#Write a log
echo "Power Failure at $(date)" >>/home/"$myname"/scripts.log

sleep 45s

zenity --warning --title "Power Failure" --text "Shutdown in 15 seconds!" & --timeout=14 2>/dev/null
sleep 15s

systemctl poweroff -i
