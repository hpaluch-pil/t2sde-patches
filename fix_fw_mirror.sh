#!/bin/bash
# replacement for corrupted zfs mirror (package kernel)
set -xeuo pipefail
cd /usr/src/t2-src
o=download/mirror/l/linux-firmware-20250311.tar.gz
curl -fLo $o https://gitlab.com/kernel-firmware/linux-firmware/-/archive/20250311/linux-firmware-20250311.tar.gz
set +x
file $o | grep 'gzip compressed data' || {
	echo "Downloaded file '$o' has unexpected format"
	exit 1
}
set -x
gzip -tv $o
# install it
t2 install linux-firmware
exit 0
