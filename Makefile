#!/bin/bash

.PHONY: up down build rebuild migrate artisan npm-build


up:
	cp ./.env ./backend/.env
	docker-compose up -d --build


down:
	docker-compose down

build:
	docker-compose build --no-cache

rebuild: down build up


# Run artisan inside php container
artisan:
	docker-compose exec php php artisan $(cmd)


# Build frontend (local builder runs automatically as service in compose)
npm-build:
	docker-compose run --rm frontend_builder


migrate:
	docker-compose exec php php artisan migrate --force