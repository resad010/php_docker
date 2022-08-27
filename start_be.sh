#!/bin/bash
source .env
docker-compose up -d
docker-compose exec -it php php artisan migrate