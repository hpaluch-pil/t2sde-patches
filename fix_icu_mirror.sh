#!/bin/bash
# fix corrupted icu4c mirror (for libreoffice package)
set -xeuo pipefail
cd /usr/src/t2-src
curl -fLo download/mirror/i/icu4c-75_1-data.zip https://github.com/unicode-org/icu/releases/download/release-75-1/icu4c-75_1-data.zip
file download/mirror/i/icu4c-75_1-data.zip
rm -f download/mirror/i/icu4c-75_1-data.zip.extck-err
# force installation of build deps:
echo "Run: t2 install libreoffice"
exit 0


