#!/usr/bin/env bash

PHONE_HOSTNAME=${PHONE_HOSTNAME:="192.168.1.92"}
PHONE_SSH_URI="root@${PHONE_HOSTNAME}"
PHONE_DEFAULT_SSH_URI="defaultuser@${PHONE_HOSTNAME}"

ssh $PHONE_SSH_URI < ./scripts/install-openrepo-storeman.sh
ssh $PHONE_SSH_URI < ./scripts/install-fernschreiber.sh
ssh $PHONE_SSH_URI < ./scripts/install-sailotp.sh
ssh $PHONE_SSH_URI < ./scripts/install-rsync.sh
rsync -a --ignore-existing ./scripts/data/mopidy.service $PHONE_SSH_URI:/etc/systemd/user/
rsync -a --ignore-existing ./scripts/data/mopidy.conf $PHONE_DEFAULT_SSH_URI:/home/defaultuser/.config/mopidy/
ssh $PHONE_SSH_URI < ./scripts/prepare-mopidy-spotify.sh
ssh $PHONE_DEFAULT_SSH_URI < ./scripts/mopidy-spotify.sh
