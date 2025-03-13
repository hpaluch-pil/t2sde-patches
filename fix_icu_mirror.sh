#!/bin/bash
# fix corrupted icu4c mirror (for libreoffice package)
set -xeuo pipefail
cd /usr/src/t2-src
icuver=76_1
icuver2=76-1
curl -fLo download/mirror/i/icu4c-${icuver}-data.zip https://github.com/unicode-org/icu/releases/download/release-${icuver2}/icu4c-${icuver}-data.zip
file download/mirror/i/icu4c-${icuver}-data.zip
rm -f download/mirror/i/icu4c-${icuver}-data.zip.extck-err
# force installation of build deps:
echo "Run: t2 install libreoffice"
exit 0


