#!/usr/bin/env bash

PUB_KEY_LOCATION=${PUB_KEY_LOCATION:=~/.ssh/id_rsa.pub}
PHONE_DEFAULTUSER=${PHONE_DEFAULTUSER:="defaultuser"}
PHONE_HOSTNAME=${PHONE_HOSTNAME:="192.168.1.92"}
PHONE_SSH_URI="${PHONE_DEFAULTUSER}@${PHONE_HOSTNAME}"
PUB_KEY_CONTENT=$(cat $PUB_KEY_LOCATION)

ssh-copy-id $PHONE_SSH_URI

ssh $PHONE_SSH_URI "su - root -c \"cd /root && mkdir -p .ssh && touch .ssh/authorized_keys && echo $PUB_KEY_CONTENT > .ssh/authorized_keys && chmod 600 .ssh/authorized_keys \""

ssh -q $PHONE_SSH_URI exit

let ret=$?
if [ $ret -eq 5 ]; then
    echo $IP$i "Refused!"  $ret
elif [ $ret -eq 255 ] ; then
    echo $IP$i "Server Down!" $ret
elif [ $ret -eq 0 ] ; then
    echo $IP$i "Root access given!"
else
    echo $IP$i "Unknown return code!"
fi
