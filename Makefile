#!make

build:
	docker compose build

up:
	docker compose up

install:
	docker compose run --rm app bundle install

fix:
	docker compose run --rm app bundle exec rubocop -A
