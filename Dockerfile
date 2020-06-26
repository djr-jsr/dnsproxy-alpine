FROM alpine:latest

LABEL maintainer="djr.kgp@gmail.com" 

#
# Install all required dependencies.
#

RUN apk --update upgrade && \
    apk add --update --no-cache bind

#
# Define container settings.
#

COPY named.conf /etc/bind/
VOLUME ["/etc/bind", "/var/bind"]

EXPOSE 53/udp
EXPOSE 53/tcp

#
# Start named.
#

CMD ["/usr/sbin/named", "-f", "-g"]