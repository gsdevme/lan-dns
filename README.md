# lan-dns

Version Control for my local LAN DNS configuration. This is installed as more of an appliance of the network

## Deployment

This assumes the host is alpine linux

```bash
apk add dnsmasq git

cd $HOME && git clone https://github.com/gsdevme/lan-dns.git

ln -sf /$HOME/lan-dns/etc/dnsmasq.conf /etc/dnsmasq.conf
ln -sf /$HOME/lan-dns/etc/periodic/daily/auto-update.sh /etc/periodic/daily/dns-auto-updater
rc-update add dnsmasq default && rc-service dnsmasq restart
```

### Updating

```bash
cd /$HOME/lan-dns/ && git pull && rc-service dnsmasq restart
```

# VIP

For redundancy multiple deployments should be used with keepalived providing a virtual ip address

```bash
apk add keepalived && rc-update add keepalived default

# /etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state MASTER
    interface eth0
    virtual_router_id 77
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass xxxxxx
    }
    virtual_ipaddress {
        172.16.16.50
    }
}
```
