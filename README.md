# telegram-messanger
telegram-messenger service for sending messages in batches with selection by type and time

# Install

# step 1
* git clone https://github.com/DmitriyEvg/telegram-messanger.git
* cd telegram-messanger
* chmod +x bin/messanger.sh
* chmod +x bin/sendmsg.sh

# step 2 (required settings bin/massanger.sh)
* bot_token="YOUR_VALUE"
* chat_id="YOUR_VALUE"

# step 3 (required settings service/telegram-messanger.service)
* { LOCAL_PATH_TO messanger.sh }

# step 4
* cp service/telegram-messanger.service /etc/systemd/system/
* systemctl daemon-reload
* systemctl enable telegram-messanger.service (autostart boot)

# start|stop|restart daemon
* systemctl (start|stop|restart) telegram-messanger.service

# Instruction include zabbix alerts
* sendmsg.sh set {msg_collector="PATH_TO_COLLECTOR_TYPE"}
* ln -s {path_to_bin}/sendmsg.sh to /usr/lib/zabbix/alertscripts/sendmsg.sh (make sym_link in zabbix allertscripts folder)
* see the zabbix documentation for further steps.
