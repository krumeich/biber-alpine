#!/bin/sh

BIBER_BRANCH=${branch:-dev}
BIBER_REPO=${repo:-plk/biber}
BIBER_BINARY=biber

ARCH=$(uname -a | awk '{print $(NF-1)}')
TARGETPLATFORM=linux-musl_${ARCH}

echo "Building branch: ${BIBER_BRANCH} of ${BIBER_REPO} for ${TARGETPLATFORM}"

git clone https://github.com/${BIBER_REPO}.git
cd biber
git checkout ${BIBER_BRANCH}

perl ./Build.PL
./Build installdeps && ./Build test && ./Build install && \
    cd ./dist/${TARGETPLATFORM} && ./build.sh

if [ -f biber-${TARGETPLATFORM} ]; then
    cp biber-${TARGETPLATFORM} /usr/local/bin/biber
fi
