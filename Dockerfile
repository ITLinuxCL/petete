# VERSION   0.2
# DOCKER-VERSION  0.4.0

from  phusion/passenger-full

run   apt-get -y update
run   apt-get -y install wget git build-essential python libexpat1-dev libexpat1 libicu-dev

run   npm install coffee-script hubot yo generator-hubot -g

run   mkdir -p /home/app/petete
run mkdir -p /etc/service/petete/
RUN touch /var/log/petete.log
RUN chown 9999:9999 /var/log/petete.log
RUN rm -f /etc/service/redis/down
ADD petete.sh /etc/service/petete/run

ADD pbruna-ssh-key.pub /tmp/your_key
RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

workdir	/home/app/petete
ADD external-scripts.json /home/app/petete/
ADD package.json /home/app/petete/
ADD hubot-scripts.json /home/app/petete/
run npm install
run npm install --save hubot-hipchat

add . /home/app/petete

run npm install
run npm install --save hubot-hipchat

CMD ["/sbin/my_init"]
