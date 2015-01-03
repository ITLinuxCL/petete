#!/bin/sh

exec su app -c "cd /home/app/petete && bin/hubot --adapter hipchat -n petete >>/var/log/petete.log 2>&1"