#!/bin/bash

up() {
    docker-compose up -d
}

upForce() {
    docker-compose build --no-cache
    docker-compose up -d --force-recreate --remove-orphans
}

shellApi() {
    docker-compose exec php sh
}

destroy() {
    docker-compose down -v --rmi all --remove-orphans
}

setupTestEnv() {
    docker-compose exec php bin/console d:d:d --force
    docker-compose exec php bin/console d:d:create
    docker-compose exec php bin/console d:m:m --no-interaction
    docker-compose exec php bin/console d:f:l --no-interaction
}

qa() {
    setupTestEnv
    docker-compose exec php vendor/bin/behat -vvv -f pretty
}

"$@"
