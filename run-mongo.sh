#!/bin/bash -ex

exec /srv/mongodb-linux-x86_64/bin/mongod --dbpath /data/mongodb --replSet rs0 --oplogSize 100 --rest --smallfiles --slowms 1500 2>&1

