# lan-dns

Version Control for my local LAN DNS configuration. This is installed as more of an appliance of the network

## Deployment

This assumes the host is alpine linux

```bash
apk add dnsmasq git

cd $HOME && git clone https://github.com/gsdevme/lan-dns.git

ln -sf /$HOME/lan-dns/etc/dnsmasq.conf /etc/dnsmasq.conf
rc-update add dnsmasq default && rc-service dnsmasq restart
```

### Updating

```bash
cd /$HOME/lan-dns/ && git pull && rc-service dnsmasq restart
```
