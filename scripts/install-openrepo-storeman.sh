#!/usr/bin/env bash

STOREMAN_VERSION=${STOREMAN_VERSION:="0.2.8-2"}
SDK_VERSION=${SDK_VERSION:="4.1.0.24"}

FILENAME="harbour-storeman-${STOREMAN_VERSION}.sdk${SDK_VERSION}.armv7hl.rpm"
DOWNLOAD_URL="https://github.com/mentaljam/harbour-storeman/releases/download/v${STOREMAN_VERSION}/$FILENAME"

mkdir -p tmp
cd tmp

if [ -f "$FILENAME" ]; then
    rpm -i $FILENAME
else
    curl -L -o $FILENAME $DOWNLOAD_URL
    rpm -i $FILENAME
fi
