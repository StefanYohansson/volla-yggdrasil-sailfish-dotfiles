#!/usr/bin/env bash

PHONE_HOSTNAME=${PHONE_HOSTNAME:="192.168.1.92"}
PHONE_SSH_URI="root@${PHONE_HOSTNAME}"

ssh $PHONE_SSH_URI < ./scripts/install-openrepo-storeman.sh
ssh $PHONE_SSH_URI < ./scripts/install-fernschreiber.sh
ssh $PHONE_SSH_URI < ./scripts/install-sailotp.sh
