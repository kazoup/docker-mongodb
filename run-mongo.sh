#!/bin/bash -ex

/srv/mongodb-linux-x86_64/bin/mongod --dbpath /data/mongodb --replSet rs0 --oplogSize 100 --rest --noprealloc --smallfiles 
