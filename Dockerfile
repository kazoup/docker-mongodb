FROM phusion/baseimage:0.9.8

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y wget

# generate a host key
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN cd /srv \
    && wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz \
    && tar xf mongodb-linux-x86_64-2.4.9.tgz \
    && mv /srv/mongodb-linux-x86_64-2.4.9 /srv/mongodb-linux-x86_64 \
    && rm -rf /srv/*.tgz

RUN mkdir -p /data/mongodb

RUN mkdir -p /etc/service/mongodb
ADD run-mongo.sh /etc/service/mongodb/run

EXPOSE 27017
EXPOSE 22
CMD ["/sbin/my_init"]
