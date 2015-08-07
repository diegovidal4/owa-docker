FROM ubuntu:14.04
MAINTAINER Diego Vidal <dvidal@tsensor.cl>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN useradd owa -d /home/owa
RUN mkdir -p /home/owa/.ssh
RUN chmod 700 /home/owa/.ssh
RUN chown owa:owa /home/owa/.ssh

RUN mkdir -p /home/owa/apps

VOLUME ["/home/owa/apps"]


ADD run /usr/local/bin/
RUN chmod +x /usr/local/bin/run
EXPOSE 22
CMD ["/usr/local/bin/run"]
