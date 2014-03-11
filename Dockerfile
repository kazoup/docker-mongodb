FROM ubuntu:13.10

RUN apt-get update
RUN apt-get upgrade -y

# Configure ssh
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN echo "root:root" | chpasswd
RUN sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config

RUN apt-get install -y wget supervisor

RUN cd /srv && wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz
RUN cd /srv && tar xf mongodb-linux-x86_64-2.4.9.tgz
RUN mv /srv/mongodb-linux-x86_64-2.4.9 /srv/mongodb-linux-x86_64
RUN rm -rf /srv/*.tgz

RUN mkdir -p /data/mongodb

ADD supervisord.conf /etc/supervisor.conf
ADD docker-run.sh /srv/

EXPOSE 27017
EXPOSE 22
CMD ["/srv/docker-run.sh"]
