FROM php:7-fpm

ARG YESWIKI_RELEASE_NAME="cercopitheque"
ARG YESWIKI_VERSION="2019-09-10-1"

RUN apt-get update \
      && apt-get install -y unzip \
      && curl -sSL https://repository.yeswiki.net/${YESWIKI_RELEASE_NAME}/yeswiki-${YESWIKI_RELEASE_NAME}-${YESWIKI_VERSION}.zip > /tmp/yeswiki.zip \
      && unzip -K -d /tmp/yeswiki /tmp/yeswiki.zip \
      && mv /tmp/yeswiki/${YESWIKI_RELEASE_NAME} /yeswiki

RUN docker-php-ext-install mysqli

WORKDIR /yeswiki

ENTRYPOINT ["php-fpm"]
