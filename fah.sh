#!/bin/sh
# A script to install and running Folding@Home
# Author: Monisan Fu(@sufuf3)
# date:20170331
#
# OS: Ubuntu
# Install and start fahcilent: sudo sh fah.sh
# Remove: sudo dpkg -P fahclient

DIR=~/
URL=https://fah.stanford.edu/file-releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb

####################
# Configuring fahclient start
# include USER, TEAM, PASSKEY, POWER, AUTOSTART
####################
# Folding@home User Name (deault: Anonymous)
# eg. USER=myuser
USER=Anonymous

# Folding@home Team Number(0 for no team)
# eg. TEAM=31403
TEAM=31403

# Folding@home Passkey (option)
# eg. PASSKEY=12jkh#(13423rl##sdfsdfw
PASSKEY=

##################
# light      - Recommended for laptops.                                   │                                                        
# medium     - Higher performance setting recommended for most desktops.  │                                                        
# full       - Contribute as much as possible. 
# How much of your system resources should be used initially?
##################
# eg. POWER=medium
POWER=medium

#Should FAHClient be automatically started? true or false
# eg. AUTOSTART=true
AUTOSTART=true

####################
# Configuring fahclient end
####################

apt-get install -y debconf-utils
cd $DIR
wget --no-check-certificate $URL
echo "fahclient fahclient/autostart boolean $AUTOSTART" | sudo debconf-set-selections
echo "fahclient fahclient/power select $POWER" | sudo debconf-set-selections
echo "fahclient fahclient/team string $TEAM" | sudo debconf-set-selections
echo "fahclient fahclient/passkey string $PASSKEY" | sudo debconf-set-selections
echo "fahclient fahclient/user string $USER" | sudo debconf-set-selections
dpkg -i fahclient_7.4.4_amd64.deb
rm -f fahclient_7.4.4_amd64.deb
