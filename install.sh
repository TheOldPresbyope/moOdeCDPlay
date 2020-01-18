echo "Install moOdeCDPlay files in moOde."
if [ ! -f /var/www/command/moode.php ]; then
    echo
    echo "I'm sorry, Dave, I'm afraid I can't do that."
    echo "This doesn't look like a moOde installation."
    exit 1
fi
sudo cp addaudiocd.sh /usr/local/bin/addaudiocd.sh
sudo cp remaudiocd.sh /usr/local/bin/remaudiocd.sh
sudo cp addaudiocd.service /etc/systemd/system/addaudiocd.service
sudo cp remaudiocd.service /etc/systemd/system/remaudiocd.service
sudo cp 99-srX.rules /etc/udev/rules.d/99-srX.rules
sudo chmod +x /usr/local/bin/addaudiocd.sh
sudo chmod +x /usr/local/bin/remaudiocd.sh
echo "Done - please reboot moOde to complete installation."
