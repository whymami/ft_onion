FROM nginx:alpine

# Nginx konfigürasyon dosyasını kopyala
COPY nginx.conf /etc/nginx/nginx.conf

# Web sitesi içeriğini kopyala (index.html dosyanızı buraya koyun)
COPY html/ /usr/share/nginx/html/

EXPOSE 80