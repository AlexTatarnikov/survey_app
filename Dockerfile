FROM ruby:2.5.1

RUN curl -sL http://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y build-essential libpq-dev locales nodejs yarn netcat-openbsd

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

WORKDIR /usr/src/app

ENV HOME=/usr/src/app PATH=/usr/src/app/bin:$PATH
ENV LANG en_US.UTF-8

ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock

ADD . /usr/src/app

RUN yarn install
RUN bundle install --jobs 20 --retry 5

COPY bin/docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]

