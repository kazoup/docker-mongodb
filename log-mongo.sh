#!/bin/bash -ex

mkdir -p /var/log/kazoup/mongo_runit
exec svlogd -tt /var/log/kazoup/mongo_runit
