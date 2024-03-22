FROM php:8.3-apache
RUN touch /usr/local/etc/php/conf.d/uploads.ini \
&& echo "file_uploads = On" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "memory_limit = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "upload_max_filesize = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "post_max_size = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "max_execution_time = 60" >> /usr/local/etc/php/conf.d/uploads.ini
RUN apt-get update \
&& apt-get install -y git curl libxml2-dev libonig-dev libzip-dev git
RUN docker-php-ext-install mysqli mbstring xml zip

WORKDIR /var/www/html
RUN git clone https://github.com/wavelog/wavelog.git .
RUN chown -R root:www-data /var/www/html
RUN git checkout master
RUN mkdir ./userdata
RUN echo "Setting root as owner of the html folder" \
&& chown -R root:www-data /var/www/html
RUN echo "Setting permissions to the install folder" \
&& cd /var/www/html \
&& chmod -R g+rw ./application/config/ \
&& chmod -R g+rw ./application/logs/ \
&& chmod -R g+rw ./assets/qslcard/ \
&& chmod -R g+rw ./backup/ \
&& chmod -R g+rw ./updates/ \
&& chmod -R g+rw ./uploads/ \
&& chmod -R g+rw ./userdata/ \
&& chmod -R g+rw ./images/eqsl_card_images/ \
&& chmod -R g+rw ./assets/ \
&& chmod -R 777 /var/www/html/install
