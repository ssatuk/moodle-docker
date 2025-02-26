#!/bin/bash
export MOODLE_DOCKER_WWWROOT=/home/julian/source/sites/ssatcloud/moodledev/moodle
export MOODLE_DOCKER_DB=pgsql
export COMPOSE_PROJECT_NAME=mdl311
export MOODLE_DOCKER_WEB_PORT=8000
cp config.docker-template.php $MOODLE_DOCKER_WWWROOT/config.php
bin/moodle-docker-compose up -d

