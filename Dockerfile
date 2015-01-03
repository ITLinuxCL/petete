# VERSION   0.2
# DOCKER-VERSION  0.4.0

from  phusion/passenger-nodejs

run   apt-get -y update
run   apt-get -y install wget git redis-server
run   apt-get -y install build-essential python
run   apt-get -y install libexpat1-dev libexpat1 libicu-dev

run   npm install coffee-script hubot -g
run   npm install --save hubot-hipchat

run   apt-get -y install supervisor
run   mkdir -p /var/log/supervisor
run   mkdir -p /opt/petete

add   supervisord.conf /etc/supervisor/conf.d/supervisord.conf

add   . /opt/petete

cmd   supervisord -n
