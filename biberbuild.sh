#!/bin/sh

BIBER_BRANCH=${branch:-dev}
BIBER_REPO=${repo:-plk/biber}

echo "Building branch: ${BIBER_BRANCH} of ${BIBER_REPO}"

git clone https://github.com/${BIBER_REPO}.git
cd biber
git checkout ${BIBER_BRANCH}

perl ./Build.PL
./Build installdeps && ./Build test && ./Build install && \
    cd ./dist/linux_x86_64-musl && ./build.sh

if [ -f biber-linux_x86_64-musl ]; then
    cp biber-linux_x86_64-musl /usr/local/bin
fi
