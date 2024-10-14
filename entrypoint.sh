#!/bin/sh
set -e

if [ ! -s /home/node/app/data/payload.sqlite ]; then
    mkdir -p /home/node/app/data
    cp /home/node/app/tmp/payload.sqlite /home/node/app/data/payload.sqlite
fi

exec "$@"