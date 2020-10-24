#!/bin/bash
echo "updating packages"
sudo apt update
sudo apt install tomcat8 -y
echo "tomcat installation completed"
cd /var/lib/tomcat8/webapps
wget https://referenceappkhaja.s3-us-west-2.amazonaws.com/gameoflife.war
echo "downloaded the war file"
