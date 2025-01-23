FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y tor

COPY torrc /etc/tor/torrc
COPY startTor.sh /var/startTor.sh
RUN chmod +x /var/startTor.sh

CMD ["/bin/sh", "-c", "tor -f /etc/tor/torrc && /var/startTor.sh"]
