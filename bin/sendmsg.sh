#!/bin/bash

msg_collector="PATH_TO_COLLECTOR_TYPE"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
subject="$1"

echo -e "$timestamp\t$subject" >> $msg_collector/$(date '+%Y%m%d%H%M%S')
