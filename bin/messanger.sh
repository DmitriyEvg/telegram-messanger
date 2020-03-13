#!/bin/bash

# Telegram API settings
bot_token="YOUR_VALUE"
chat_id="YOUR_VALUE"

## Telegram API messanger function
function send_message(){
    request=$(curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d chat_id=$1 -d text="$2")
}

## Zabbix msg collector
zbx_coll_path="PATH_TO_COLLECTOR_ZABBIX"
function send_zbx_msg(){
    let "doneTime=$(date '+%Y%m%d%H%M%S') - 1"
    fileList=( $(ls $zbx_coll_path) )
    for fileName in ${fileList[@]}
    do
        if [[ "$fileName" -le "$doneTime" ]]; then
            msg=$(cat $zbx_coll_path/$fileName)
            send_message $chat_id "$msg"
            rm $zbx_coll_path/$fileName -f
        fi
    done
}

## Worker for send msg
function msgWorker(){
while true; do
    send_zbx_msg
    sleep 5
done
}

## Start application
msgWorker
