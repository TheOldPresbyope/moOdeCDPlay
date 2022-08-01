echo "Install V0 moOdeCDPlay files in moOde."
# moOdeCDPlay V0.2 script
# assume user knows what they're doing and don't check we're installing on a moOde player
sudo cp addaudiocd.sh /usr/local/bin/addaudiocd.sh
sudo cp remaudiocd.sh /usr/local/bin/remaudiocd.sh
sudo cp addaudiocd.service /etc/systemd/system/addaudiocd.service
sudo cp remaudiocd.service /etc/systemd/system/remaudiocd.service
sudo cp 99-srX.rules /etc/udev/rules.d/99-srX.rules
sudo chmod +x /usr/local/bin/addaudiocd.sh
sudo chmod +x /usr/local/bin/remaudiocd.sh
echo "Done - please reboot moOde to complete installation."
