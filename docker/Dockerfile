#specifier la version de php
FROM php:8.1-apache

#telechargement du fichier pour le stoker dans le /usr/local/bin
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

#rendre le fichier executable et l'utiliser
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo_pgsql intl

#installation de composer
RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
   mv composer.phar /usr/local/bin/composer

#installation de node js et de npm
RUN apt update && apt install -yqq nodejs npm

#copier à l'interieur de l'image le contenu de l'application
COPY . /var/www/

#copy du fichier de configuration à l'interieur de notre image:projet
COPY ./docker/apache.conf /etc/apache2/sites-available/000-default.conf

#installation de dependance du projet
RUN cd /var/www && \
    composer install && \
    npm install --force && \
    npm run build

#definition du repertoire de travail  
WORKDIR /var/www/

ENTRYPOINT ["bash", "./docker/docker.sh"]

#exposer le port (on peut le mapper sur un autre port)
EXPOSE 80