#!/bin/bash

URL=$(basename $(dirname $(readlink -f ${BASH_SOURCE[0]})))

pushd output
sftp webhost:${URL}/html <<EOF
put *.html
put -r posts
put -r static
put -r cv
EOF
popd
