FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install curl vim -y

RUN apt-get install nginx -y

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

RUN apt-get install software-properties-common python-software-properties -y

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update

RUN apt-get install php7.2 php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-dev php7.2-fpm php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-json php7.2-mbstring php7.2-mysql php7.2-snmp php7.2-soap php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip php7.2-xmlrpc -y

#RUN sed -i -e "s/;\?daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.2/fpm/www.conf
RUN apt-get install redis-server -y

RUN apt-get install autoconf zlib1g-dev -y

RUN pecl install grpc

# Nginx config
RUN rm /etc/nginx/sites-enabled/default
ADD ./docker/symfony.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony.conf

RUN rm /var/www/html/index.nginx-debian.html
RUN mkdir /var/www/html/public_html
COPY index.php /var/www/html/public_html/index.php
EXPOSE 80
#COPY docker-entrypoint.sh /
#RUN chmod +x /docker-entrypoint.sh
#ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
#CMD ["nginx", "-g", "daemon off;"]
CMD service php7.2-fpm start && service redis-server start && nginx
