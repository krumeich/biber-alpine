#!/bin/sh

BIBER_VERSION=$(docker run --rm -v $(pwd):/usr/local/bin alpine /usr/local/bin/biber --version | sed "s,biber version: \([[:digit:]]\+\.[[:digit:]]\+\).*,\1,")
PRODUCT=biber
METAPLATFORM=linux-musl
METAPLATFORM_DIR=${PRODUCT}-${METAPLATFORM}
ARCHIVE=${PRODUCT}-${BIBER_VERSION}-${METAPLATFORM}_x86_64.tar

rm -rf ${METAPLATFORM_DIR}
mkdir -p ${METAPLATFORM_DIR}
tar cf ${METAPLATFORM_DIR}/${ARCHIVE} biber

cat >${METAPLATFORM_DIR}/README <<EOF
These are biber binaries for the ${METAPLATFORM} platform.
See https://ctan.org/pkg/biber for documentation, sources, and all else.
EOF

tar czf ${METAPLATFORM_DIR}.tar.gz ${METAPLATFORM_DIR}

