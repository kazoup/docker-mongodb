#!/bin/bash -ex

exec /srv/mongodb-linux-x86_64/bin/mongod --dbpath /data/mongodb --rest --slowms 1500 2>&1

