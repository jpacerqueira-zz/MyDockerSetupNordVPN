#!/usr/bin/env bash
#
NORD_EMAIL=$1
NORD_PASSWD=$2 ## PASSWORD
NORD_COUNTRY=$3 ## country ## United_States
#
docker run -ti --cap-add=NET_ADMIN --cap-add=SYS_MODULE --device /dev/net/tun --name vpn \
            --sysctl net.ipv4.conf.all.rp_filter=2 \
            -e USER=${NORD_EMAIL} -e PASS={NORD_PASSWD} \
            -e CONNECT=${NORD_COUNTRY} -e TECHNOLOGY=NordLynx -d bubuntux/nordvpn
##########  -e TECHNOLOGY=NordLynx -d  jpacerqueira83/nordvpn
#
ECHO ">> include VPN in all docker container runs"
ECHO ">> docker run -it --net=container:vpn -d some/docker-container "
#
