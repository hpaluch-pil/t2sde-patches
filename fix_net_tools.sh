#!/bin/bash
# replace defect original site (not found)
set -xeuo pipefail
cd /usr/src/t2-src
curl -fLo download/mirror/n/net-tools-1.60.tar.bz2 https://sourceforge.net/projects/net-tools/files/net-tools-1.60.tar.bz2/download
file download/mirror/n/net-tools-1.60.tar.bz2
t2 build-target -cfg isomin 2-net-tools
exit 0
