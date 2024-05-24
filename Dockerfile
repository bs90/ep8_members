FROM ruby:3.2.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client vim

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app
