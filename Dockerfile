FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && apt-get purge -y --auto-remove
RUN mkdir /sandbox
WORKDIR /sandbox
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . /sandbox
