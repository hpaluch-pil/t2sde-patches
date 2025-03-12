#!/bin/bash
# replacement for corrupted zfs mirror (package kernel)
set -xeuo pipefail
cd /usr/src/t2-src
curl -fLo download/mirror/z/zfs-2.3.1.tar.gz https://github.com/openzfs/zfs/releases/download/zfs-2.3.1/zfs-2.3.1.tar.gz
file download/mirror/z/zfs-2.3.1.tar.gz
# => download/mirror/r/rsync-3.4.1.tar.gz: gzip compressed data, ...
rm download/mirror/z/zfs-2.3.1.tar.gz.cksum-err
# again trydownload it:
t2 download linux
exit 0
