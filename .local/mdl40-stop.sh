#!/bin/bash
bin/moodle-docker-compose stop
export MOODLE_DOCKER_WWWROOT=/home/julian/source/sites/ssatcloud/moodledev/moodle
unset COMPOSE_PROJECT_NAME
export MOODLE_DOCKER_WEB_PORT=8000
