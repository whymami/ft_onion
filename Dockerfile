FROM nginx:latest

RUN apt-get update && apt-get install -y tor openssh-server

COPY ./index.html /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./torrc /etc/tor/torrc
COPY ./sshd_config /etc/ssh/sshd_config

RUN useradd -ms /bin/bash torUser && echo "torUser:torUser" | chpasswd
RUN chown -R torUser:torUser /etc/tor /var/lib/tor /var/log/tor

EXPOSE 80
EXPOSE 4242

CMD sh -c "service ssh start \
        && tor -f /etc/tor/torrc \
        && nginx -g 'daemon off;'"

