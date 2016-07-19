FROM alpine:latest
MAINTAINER 2infinite <2infinite@users.noreply.github.com>
RUN apk --no-cache add openntpd && cp /etc/ntpd.conf /etc/ntp-client.conf && sed -i 's/#listen on/listen on/' /etc/ntpd.conf 
CMD ["ntpd", "-d"]
