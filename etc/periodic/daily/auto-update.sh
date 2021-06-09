#!/bin/sh

cd /$HOME/lan-dns/ && git pull && rc-service dnsmasq restart
