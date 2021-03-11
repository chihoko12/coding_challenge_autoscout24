FROM quay.io/chihoko12/rails-base-chrome-imagemagick
ARG BUNDLER_VERSION
ENV BUNDLER_VERSION=${BUNDLER_VERSION:-2.2.10}

COPY ./Aptfile /tmp/Aptfile
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  $(cat /tmp/Aptfile | xargs) && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  truncate -s 0 /var/log/*log

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

ENV PATH /app/bin:$PATH

WORKDIR /app

RUN gem update --system && \
  gem install bundler -v $BUNDLER_VERSION
