#!/bin/sh
touch ~/servathan_log.log
echo "Running on startup!" >> ~/servathan_log.log
echo $(date) >> ~/servathan_log.log

sleep 10
#make sure this file lives at /etc/init.d/
#and at /etc/rc.local
cd ~/linux-testbed/composetest/;
sudo docker compose down
sleep 20
echo $(date) >> ~/servathan_log.log
echo $(sudo docker ps) >> ~/servathan_log.log
echo "Composed down?" >> ~/servathan_log.log
echo $(date) >> ~/servathan_log.log
echo "Starting docker back up" >> ~/servathan_log.log

sudo docker compose up --build
echo "Successful startup" >> ~/servathan_log.log
echo $(date) >> ~/servathan_log.log

exit 0

