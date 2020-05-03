#!/bin/sh
# Edit between the lines
#---------------------
PROTOCOL=gp # options: gp, nc, anyconnect
URL=vpn.acme.com
AUTHGROUP=RGN # options: RGN, TGN; comment this if not applicable
#---------------------
CONFIGFILE="/etc/openconnect/openconnect.conf"
HIPREPORT="/etc/openconnect/hipreport.sh"
PASSFILE="/etc/openconnect/secret"
MESSAGE="[=== SQUID-OPENCONNECT ===]"
SQUIDPORT=3128
cat /etc/hosts_extra >> /etc/hosts;
clear
squid
clear
# comment this when there is AUTHGROUP applicable
sudo openconnect --background --protocol=$PROTOCOL $URL --config=$CONFIGFILE --csd-wrapper=$HIPREPORT --authgroup=$AUTHGROUP --passwd-on-stdin < $PASSFILE
# uncomment this when no AUTHGROUP applicable
# sudo openconnect --background --protocol=$PROTOCOL $URL --config=$CONFIGFILE --csd-wrapper=$HIPREPORT --passwd-on-stdin < $PASSFILE
clear
echo $MESSAGE
read
