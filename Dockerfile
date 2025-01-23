FROM debian:bullseye

RUN apt-get update && apt-get install -y tor openssh-server nginx

COPY ./index.html /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./torrc /etc/tor/torrc
COPY ./sshd_config /etc/ssh/sshd_config

RUN useradd -ms /bin/bash torUser && echo "torUser:torUser" | chpasswd
COPY ./entrypoint.sh /home/torUser/entrypoint.sh
RUN chmod 777 /home/torUser/entrypoint.sh

EXPOSE 80
EXPOSE 4242

ENTRYPOINT [ "/home/torUser/entrypoint.sh" ]
