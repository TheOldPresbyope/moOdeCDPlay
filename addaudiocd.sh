#!/bin/bash
# moOdeCDPlay V0.1 script

#clear the queue
/usr/bin/mpc -q clear
# make drive readable, just in case
# (allow for odd enumeration)
if [ -b /dev/sr0 ]; then
   chmod 644 /dev/sr0
elif [ -b /dev/sr1 ]; then
   chmod 644 /dev/sr1
else
  exit 1
fi

#get the track count from udev
tracks=$(udevadm info --query=property /dev/cdrom | \
sed -n 's/ID_CDROM_MEDIA_TRACK_COUNT_AUDIO=\(.*\)/\1/p')

#add each track to mpd queue 
for ((i=1; i<=$tracks; i++)); do
   /usr/bin/mpc -q add cdda:///$i
done
