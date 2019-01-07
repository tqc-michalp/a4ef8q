FROM ruby:2.6.0
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN apt-get purge -y --auto-remove
RUN mkdir /sandbox
WORKDIR /sandbox
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . /sandbox
