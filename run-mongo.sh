#!/bin/bash -ex

exec /srv/mongodb-linux-x86_64/bin/mongod --dbpath /data/mongodb --replSet rs0 --oplogSize ${MONGO_OPLOG_SIZE:=20480} --rest --slowms 1500 2>&1

