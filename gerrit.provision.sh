#!/bin/bash
yum update
yum install -y vim git tree wget
yum install bind-utils -y #for dig

mkdir -p /root/git
MY_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

cd /vagrant/
if [ -f "/vagrant/gerrit-2.9.2.war" ] 
 then
  echo "gerrit-2.9.2.war exists"
 else
  wget http://gerrit-releases.storage.googleapis.com/gerrit-2.9.2.war
fi
java -jar gerrit-2.9.2.war init -d /srv/gerrit < gerrit.answer.file

sed -i "s/gerrit.test.com:8080/${MY_IP}:8010/" /srv/gerrit/etc/gerrit.config


/srv/gerrit/bin/gerrit.sh restart

