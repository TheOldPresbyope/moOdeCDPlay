#!/bin/bash
#clear the queue
/usr/bin/mpc -q clear
# make drive readable
# (allow for odd enumeration)
if [ -b /dev/sr0 ]; then
   chmod 644 /dev/sr0
elif [ -b /dev/sr1 ]; then
   chmod 644 /dev/sr1
else
  exit 1
fi

#count the tracks
# (Yes, udev already knows the count, but getting 
# to its list of environment variables seems a hack.)
tracks=$(/usr/bin/cdparanoia -sQ |& grep -P "^\s+\d+\." | wc -l)

#add each track to mpd queue 
for ((i=1; i<=$tracks; i++)); do
   /usr/bin/mpc -q add cdda:///$i
done
