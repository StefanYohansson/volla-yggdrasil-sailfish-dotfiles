#!/usr/bin/env bash

zypper --non-interactive install python3-gobject

# install libspotify
curl https://raw.githubusercontent.com/mopidy/libspotify-deb/master/libspotify/armhf/include/libspotify/api.h -o api.h
curl -L https://github.com/mopidy/libspotify-deb/raw/master/libspotify/armhf/lib/libspotify.so.12.1.103 -o libspotify.so.12.1.103

mkdir -p /usr/include/libspotify/
cp api.h /usr/include/libspotify/
cp libspotify.so.12.1.103 /usr/lib
ln -s /usr/lib/libspotify.so.12.1.103 /usr/lib/libspotify.so.12
ln -s /usr/lib/libspotify.so.12.1.103 /usr/lib/libspotify.so

zypper --non-interactive install gcc
zypper --non-interactive install python3-devel
zypper --non-interactive install libffi-devel

touch /etc/pulse/xpolicy.conf.d/mopidy.conf

cat <<EOT > /etc/pulse/xpolicy.conf.d/mopidy.conf
[stream]
exe      = python3
group    = player
EOT
