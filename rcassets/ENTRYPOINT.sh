#!/bin/bash

## THis is run *inside* new docker instnce, but has mounted the
## secrets volume

# must not be in docker
echo "ran me1" >> /home/pbrian/ranme1

SECRETS_VOL="/var/secrets/usb"
cp -r $SECRETS_VOL/.ssh/* /home/pbrian/.ssh

chown -R pbrian:pbrian /home/pbrian/
chown -R pbrian:pbrian /home/pbrian/.ssh
chmod -R 0700 /home/pbrian/.ssh
 
###
mkdir /home/pbrian/.aws
cp -r $SECRETS_VOL/aws-credentials /home/pbrian/.aws/credentials

#Now finally start this ready for XForwarding
/usr/sbin/sshd -D
