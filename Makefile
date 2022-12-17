#!make

build:
	docker compose build

up:
	docker compose up

install:
	docker compose run --rm app bundle install

console:
	docker compose run --rm app bundle exec rack-console

lint:
	docker compose run --rm app bundle exec rubocop

fix:
	docker compose run --rm app bundle exec rubocop -A

api_test:
	docker compose run --rm app bundle exec rspec

db.create:
	docker compose run --rm app bundle exec rake db:create

db.migrate:
	docker compose run --rm app bundle exec rake db:migrate

db.drop:
	docker compose run --rm app bundle exec rake db:drop

db.reset:
	docker compose run --rm app bundle exec rake db:reset

db.create_migration:
	docker compose run --rm app bundle exec rake db:create_migration NAME=${name}
