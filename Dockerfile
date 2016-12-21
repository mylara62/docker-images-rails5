FROM ruby:2.3.1
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev
RUN mkdir /demo_app
WORKDIR /demo_app
ADD Gemfile /demo_app/Gemfile
ADD Gemfile.lock /demo_app/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /demo_app