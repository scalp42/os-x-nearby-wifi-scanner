#!/bin/sh

# OS X based shell script for gathering information about nearby wireless access points.
# daniel @ portwd.com

CURRENT_SSID=`/usr/sbin/airport -I | grep SSID | tail -1 | /opt/local/bin/gawk ' { print ( $(NF-0) ) }'`
UNIX_TIMESTAMP=`/bin/date +%s`

YOUR_USER=`whoami`
YOUR_DIRECTORY=`/Users/${YOUR_USER}`

YOUR_REMOTE_USER=''
YOUR_REMOTE_MACHINE=''

declare -x SSH_AUTH_SOCK=$( find /tmp/launch-*/Listeners -user ${YOUR_USER} -type s | head -1 )

if [ -n "$CURRENT_SSID" ]; then
	/usr/sbin/airport -s > ${YOUR_DIRECTORY}/ssids-nearby-$CURRENT_SSID-$UNIX_TIMESTAMP
	/usr/bin/rsync -avd -e 'ssh -i /PATH/TO/YOUR/KEY' ${YOUR_DIRECTORY}/ssids* ${YOUR_REMOTE_USER}@${YOUR_REMOTE_MACHINE}:/PATH/TO/REMOTE/DIR
fi
