#!/bin/bash -ex

env

/etc/init.d/ssh start

mkdir -p /srv/logs
touch /srv/logs/supervisord.log /srv/logs/mongodb.log
trap '{ echo "Trap command called"; supervisorctl stop all; exit 0;}' EXIT
/usr/bin/supervisord -c /etc/supervisor.conf 2>&1 > /srv/logs/supervisord.log & tail -f /srv/logs/supervisord.log /srv/logs/mongodb.log
