FROM nginx:latest

RUN apt-get update && apt-get install -y tor

COPY ./index.html /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./torrc /etc/tor/torrc

EXPOSE 80
EXPOSE 4242

CMD sh -c "tor -f /etc/tor/torrc & nginx -g 'daemon off;'"