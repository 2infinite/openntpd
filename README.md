# openntpd

[OpenNTPD](http://www.openntpd.org/) server running on [Alpine Linux:latest](https://hub.docker.com/_/alpine/).

## Usage:

* Openntpd required Linux capabilities SYS_TIME and SYS_NICE:
```sh
--cap-add SYS_TIME --cap-add SYS_NICE
```
* Mount the container's root filesystem as read only:
```sh
--read-only=true --tmpfs /var/run:rw,noexec,nosuid,size=1m --tmpfs /var/db:rw,noexec,nosuid,size=8m
```

### Examples:

#### 1. Run NTP server:
```sh
docker run -d --log-driver=syslog --log-opt tag="{{.Name}}/{{.ID}}" --restart=always --name ntpd --read-only=true \
 --tmpfs /var/run:rw,noexec,nosuid,size=1m --tmpfs /var/db:rw,noexec,nosuid,size=8m \
 --cpuset-cpus="0-1" -m 64m --kernel-memory="32m" --memory-swap="128m" --cap-add SYS_TIME \
 --cap-add SYS_NICE -p 123:123/udp --security-opt no-new-privileges 2infinity/openntpd:latest
```
#### 2. Run NTP client:
```sh
docker run -d --log-driver=syslog --log-opt tag="{{.Name}}/{{.ID}}" --restart=always --name ntpd --read-only=true \
 --tmpfs /var/run:rw,noexec,nosuid,size=1m --tmpfs /var/db:rw,noexec,nosuid,size=8m \
 --cpuset-cpus="0-1" -m 64m --kernel-memory="32m" --memory-swap="128m" --cap-add SYS_TIME \
 --cap-add SYS_NICE --security-opt no-new-privileges 2infinity/openntpd:latest ntpd -d -f /etc/ntp-client.conf
```
