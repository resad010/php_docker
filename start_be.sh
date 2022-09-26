#!/bin/bash
docker-compose up -d
docker exec -t pdp_php php artisan migrate
