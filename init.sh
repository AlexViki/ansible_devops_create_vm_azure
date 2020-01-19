#!/bin/bash -ex

sudo apt install wget

cat <<EOF > /etc/some_file
some content
EOF

echo hello worl
