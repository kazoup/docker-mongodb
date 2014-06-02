FROM phusion/baseimage:0.9.8

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y wget

# add the kazoup dev ssh key
ADD id_rsa.kazoup_dev.pub /tmp/id_rsa.kazoup_dev.pub
RUN cat /tmp/id_rsa.kazoup_dev.pub >> /root/.ssh/authorized_keys && rm -f /tmp/id_rsa.kazoup_dev.pub
#RUN chmod 600 /root/.ssh/authorized_keys

# generate a host key
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN cd /srv \
    && wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz \
    && tar xf mongodb-linux-x86_64-2.4.9.tgz \
    && mv /srv/mongodb-linux-x86_64-2.4.9 /srv/mongodb-linux-x86_64 \
    && rm -rf /srv/*.tgz

RUN mkdir -p /data/mongodb

RUN mkdir -p /etc/service/mongodb
RUN mkdir -p /var/log/kazoup
ADD run-mongo.sh /etc/service/mongodb/run
ADD log-mongo.sh /etc/service/mongodb/log/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
EXPOSE 27017
EXPOSE 22

