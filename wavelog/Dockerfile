FROM php:8.3-apache

# Install dependencies
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libzip-dev \
        cron \
    ; \
    \
    docker-php-ext-install -j "$(nproc)" \
        mysqli \
        zip \
    ; \
    \
    a2enmod rewrite;

# Enabling custom upload settings in PHP
RUN set -ex; \
    \
    { \
        echo 'file_uploads = On'; \
        echo 'memory_limit = 256M'; \
        echo 'upload_max_filesize = 64M'; \
        echo 'post_max_size = 64M'; \
        echo 'max_execution_time = 600'; \
    } > $PHP_INI_DIR/conf.d/wavelog.ini;

# Download tarball and extract
WORKDIR /var/www/html
RUN set -ex; \
    curl -L https://api.github.com/repos/wavelog/wavelog/tarball/master | tar -xz --strip=1;

# Setting permissions as: https://github.com/wavelog/Wavelog/wiki/Installation#3-set-directory-ownership-and-permissions
RUN set -ex; \
        mkdir userdata/; \
        mkdir application/config/docker/; \
        \
        chown -R root:www-data application/config/; \
        chown -R root:www-data application/logs/; \
        chown -R root:www-data assets/json/; \
        chown -R root:www-data assets/qslcard/; \
        chown -R root:www-data backup/; \
        chown -R root:www-data updates/; \
        chown -R root:www-data uploads/; \
        chown -R root:www-data userdata/; \
        chown -R root:www-data images/eqsl_card_images/; \
        chown -R root:www-data install/; \
        \
        chmod -R g+rw application/config/; \
        chmod -R g+rw application/logs/; \
        chmod -R g+rw assets/json/; \
        chmod -R g+rw assets/qslcard/; \
        chmod -R g+rw backup/; \
        chmod -R g+rw updates/; \
        chmod -R g+rw userdata/; \
        chmod -R g+rw uploads/; \
        chmod -R g+rw images/eqsl_card_images/; \
        chmod -R g+rw install;

# Installing cronjobs as: https://github.com/wavelog/wavelog/wiki/Recommended-Cron-Jobs
COPY crontab /etc/cron.d/wavelog

# Run the command on container startup
#CMD cron

