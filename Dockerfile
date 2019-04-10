FROM ruby:2.6.2
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN apt-get purge -y --auto-remove
RUN mkdir /backend
WORKDIR /backend
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN gem install bundler
RUN gem install foreman
RUN bundle install
COPY . /backend
