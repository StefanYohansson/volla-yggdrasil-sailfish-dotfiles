Volla Yggdrasil Sailfish OS Dotfiles
===

I made this repo because after many trials to install, configure and improve things, I broke my OS so many times and need to reconfigure everything so many times.

This is an always WIP project and I only tested this in a volla phone with brand new installation, no apps installed when running this. Feel free to try if you are feeling brave.


## Preparation

Run `./setup.sh`, it will install your `id_rsa.pub` on your phone for `defaultuser` and `root` users. If your ssh pub file is named differently, you can run passing env variable like this: `PUB_KEY_LOCATION=~/.ssh/myfile.pub ./setup.sh`

env variables accepted

```bash
PUB_KEY_LOCATION=${PUB_KEY_LOCATION:=~/.ssh/id_rsa.pub}
PHONE_DEFAULTUSER=${PHONE_DEFAULTUSER:="defaultuser"}
PHONE_HOSTNAME=${PHONE_HOSTNAME:="192.168.1.92"}
PHONE_SSH_URI="${PHONE_DEFAULTUSER}@${PHONE_HOSTNAME}"
PUB_KEY_CONTENT=$(cat $PUB_KEY_LOCATION)
```

## Installation

all the scripts should be idempotent, so if you run multiple times it should not install multiple times the same app or crash because of that but look I tell you that this is a WIP, so maybe I forgot some if or validation somewhere.

`./runner.sh`

What this will install?

- openrepo / storeman
- mopidy + mopidy-iris (with spotify support)
- Fernschreiber
- sailotp
