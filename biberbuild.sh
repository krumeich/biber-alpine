#!/bin/sh

BIBER_BRANCH=${branch:-dev}
BIBER_REPO=${repo:-plk/biber}
BIBER_BINARY=biber

ARCH=$(uname -a | awk '{print $(NF-1)}')

echo "Building branch: ${BIBER_BRANCH} of ${BIBER_REPO}"

git clone https://github.com/${BIBER_REPO}.git
cd biber
git checkout ${BIBER_BRANCH}

perl ./Build.PL
./Build installdeps && ./Build test && ./Build install && \
    cd ./dist/linux_${ARCH}-musl && ./build.sh

if [ -f biber-linux_${ARCH}-musl ]; then
    cp biber-linux_${ARCH}-musl /usr/local/bin/biber
fi
