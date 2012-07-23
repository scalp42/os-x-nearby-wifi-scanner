# OS X nearby-wifi scanner

## What? 

OS X based shell script for gathering information about nearby wireless access points. It scans what's around your wireless adapter in your Macbook (using `airport` utility) and provides you with the text file output and information about SSIDs, BSSIDs, their channels, signal strenght and types of encryption nearby the access point you are connected to.

## Setup 

By default it produces output in your logged user's homedir with the name ``ssids-nearby-$CONNECTED_SSID-$UNIX_TIMESTAMP``
You can ofcourse change the target directory, together with user.

In case you put it into your cron (or Mac OS X's launchd, see: http://blog.portwd.com/sysadmin/os-x-lion-ssh-rsync-scripts-not-working-automatically/), you will get a perodical scanner, regardless of which access point you are connected to.

There's also a remote upload functionality, via rsync you can transfer these data to your other machines (perhaps because of the storage or something..)

Variables needed to be set for remote upload:

``$YOUR_REMOTE_USER`` - your SSH remote user

``$YOUR_REMOTE_MACHINE`` - your SSH remote machine

(and maybe some other stuff like SSH ports or keys..)

## Miscellaneous

Always open for tuning. :)
