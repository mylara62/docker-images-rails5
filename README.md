# Docker Installation Ubuntu 16.04(64bit)& Setup with Rails Application

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

Steps:

#### 1. Setup Docker in your local system

#### 2. Generate Rails Repo

#### 3. Create Dockerfile
	
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

#### 4. Create an empty Gemfile.lock

**The Gemfile.lock file is where the bundler will record the exact versions of the packages that were installed. You must add this file in order for the image to be built properly.**

touch Gemfile.lock

#### 5.Create the docker-compose.yml file and Connect the database

development: &default
  adapter: postgresql
  encoding: unicode
  database: demo_app_development
  pool: 5
  username: postgres
  password: password
  host: db

test:
  <<: *default
  database: demo_app_test

**Notice the host is db. When we linked the containers in our docker-compose.yml file our web container can access our db container using the hostname db.**

#### 6.Create the database

	docker-compose run web rake db:create

#### 7.Run docker-compose up to start the server

	docker-compose up -d

#### 8.See your view

If you're running docker-machine, you can find your machine's IP address by running:

docker-machine ip default
(Assuming you are using the default machine name.)

And open your browser and navigate to {IP}:3000. Mine is http://192.168.99.100:3000.

If you're running Docker locally, you can simply go to http://localhost:3000

Thanks.