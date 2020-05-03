# Docker Openconnect Squid
[Dockerfile](Dockerfile) to build Alpine-based docker image.

### Openconnect Squid =  VPN + Proxy
Squid is a proxy server while Openconnect is an open source vpn client. This is a combination of them in one container package.


## Configuration
1. edit [secret](secret) password of your Openconnect account:
```
my-super-S3cr3t-P455Phr453-u!@#$%
```

2. edit [openconnect.conf](openconnect.conf) to match your profile:

```
# SAMPLE
user=my_sweet_username
key=my_key
...
```

3. edit [openconnect_squid.sh](openconnect_squid.sh) as the init script for squid+openconnect:
    - `PROTOCOL`=`anyconnect` | `nc` | `gp`
    - `URL`=\<your-vpn-url\>
    - `AUTHGROUP`=`RGN` | `TBN`
```
# SAMPLE
PROTOCOL=gp
URL=abc.com
AUTHGROUP=RGN
...
```
4. edit [squid.conf](squid.conf) to suit your needs;
5. edit [hosts](hosts) to represents a simple mapping of ip address to domain name:
```
# SAMPLE HOSTS
1.2.3.4 abc.tv
5.6.7.8 xyz.xyz
1.3.5.7 odd.org
2.4.6.8 even.net
```
6. edit [hipreport.sh](hipreport.sh) only when your host information profile (hip) is expired.


## Docker Commands

### build
```
docker build -t openconnect-squid .
```

### run

```
docker run --name openconnect-squid -itd --privileged --publish 3128:3128 --restart=always openconnect-squid
```

### stop
```
docker stop openconnect-squid
```

### remove
```
docker rm openconnect-squid
```

### check if is running
```
docker ps -a
```

### enter container while running
```
docker exec -it openconnect-squid
```
