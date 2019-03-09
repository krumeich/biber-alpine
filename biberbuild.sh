#!/bin/sh

BIBER_BRANCH=${branch:-master}

echo "Building branch: ${BIBER_BRANCH}"

git clone https://github.com/krumeich/biber.git
cd biber
git checkout ${BIBER_BRANCH}

perl ./Build.PL
./Build installdeps && ./Build test && ./Build install && \
    cd ./dist/linux_x86_64-musl && ./build.sh

if [ -f biber-linux_x86_64-musl ]; then
    cp biber-linux_x86_64-musl /usr/local/bin
fi
