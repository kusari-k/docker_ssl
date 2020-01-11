FROM centos
MAINTAINER kusari-k

EXPOSE 80

RUN yum update -y
RUN yum install -y wget
RUN yum clean all

RUN mkdir -p /var/log/docker_log
RUN wget https://dl.eff.org/certbot-auto
RUN mv certbot-auto /usr/local/bin/certbot-auto
RUN chmod 755 /usr/local/bin/certbot-auto

COPY run.sh  /usr/local/bin/
RUN  chmod 755 /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]