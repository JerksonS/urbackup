FROM ubuntu
ENV VERSION 2.1.19

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
&& apt-get install -y \
&& apt-get clean

ADD https://www.urbackup.org/downloads/Server/2.1.19/urbackup-server_2.1.19_amd64.deb /root/urbackup.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y /root/urbackup.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -f

#ADD backupfolder /etc/urbackup/backupfolder
#RUN chmod +x /etc/urbackup/backupfolder

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623

VOLUME [ "/var/urbackup", "/var/log", "/backup"]
ENTRYPOINT ["/usr/bin/urbackupsrv"]
CMD ["run"]
