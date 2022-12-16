#!make

build:
	docker compose build

up:
	docker compose up

install:
	docker compose run --rm app bundle install

fix:
	docker compose run --rm app bundle exec rubocop -A

api_test:
	docker compose run --rm app bundle exec rspec

db.create:
	docker compose run --rm app bundle exec rake db:create

db.drop:
	docker compose run --rm app bundle exec rake db:drop

db.reset:
	docker compose run --rm app bundle exec rake db:reset
