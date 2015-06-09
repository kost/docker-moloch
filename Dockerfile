FROM debian:jessie
MAINTAINER kost - https://github.com/kost

RUN apt-get -qq update && \
apt-get install -yq  wget curl libpcre3-dev uuid-dev libmagic-dev pkg-config g++ flex bison zlib1g-dev libffi-dev gettext libgeoip-dev make libjson-perl libbz2-dev libwww-perl libpng-dev xz-utils libffi-dev python git openjdk-7-jdk libssl-dev && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add scripts
ADD /scripts /data/
RUN chmod 755 /data/startmoloch.sh && chmod 755 /data/buildmoloch.sh 
RUN /data/buildmoloch.sh /data/moloch-git

# VOLUME ["/data/moloch/logs","/data/moloch/data","/data/moloch/raw","/data/pcap"]
VOLUME ["/data/pcap"]
EXPOSE 8005
WORKDIR /data/moloch

ENTRYPOINT ["/data/startmoloch.sh"]


