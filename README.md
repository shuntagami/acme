# Acme

This is simple REST API server by [Sinatra](https://sinatrarb.com/) interact with MySQL, influenced by Ruby on Rails.

## Keywords

- [OpenAPI Specification](https://swagger.io/specification/)
- [Puma](https://github.com/puma/puma)
- [ActiveRecord](https://github.com/rails/rails/tree/main/activerecord/)
- [RSpec](https://relishapp.com/rspec/rspec-rails/docs)
- [Committee](https://github.com/interagent/committee)
- [i18n](https://github.com/ruby-i18n/i18n)

## Build Docker image

```
$ make build
```

## Create DB and migrate

```
$ make db.create && make db.migrate
```

## Run application and check if app is healthy

```
$ make up
curl localhost:4567/_healthcheck
{"msg":"ok"}
```

## Run test

```
$ make api_test
```
