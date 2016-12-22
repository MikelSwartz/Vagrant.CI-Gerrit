#!/bin/bash
yum install wget -y
yum install git -y
#yum install java-1.7.0-openjdk 
cd /vagrant/
if [ -f "/vagrant/gerrit-2.9.2.war" ] 
 then
  echo "gerrit-2.9.2.war exists"
 else
  wget http://gerrit-releases.storage.googleapis.com/gerrit-2.9.2.war
fi
java -jar gerrit-2.9.2.war init -d /srv/gerrit < gerrit.answer.file
/srv/gerrit/bin/gerrit.sh restart
