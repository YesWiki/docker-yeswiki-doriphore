FROM php:7-fpm

ARG YESWIKI_RELEASE_NAME="cercopitheque"
ARG YESWIKI_VERSION="2019-09-10-1"

RUN apt-get update \
      && apt-get install -y --no-install-recommends unzip wget \
      && curl -sSL https://repository.yeswiki.net/${YESWIKI_RELEASE_NAME}/yeswiki-${YESWIKI_RELEASE_NAME}-${YESWIKI_VERSION}.zip > /tmp/yeswiki.zip \
      && unzip -K -d /tmp/yeswiki /tmp/yeswiki.zip \
      && mv /tmp/yeswiki/${YESWIKI_RELEASE_NAME} /yeswiki \
      && chgrp -R 33 /yeswiki \
      && docker-php-ext-install mysqli \
      && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
      && apt install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb

WORKDIR /yeswiki

ENTRYPOINT ["php-fpm"]
