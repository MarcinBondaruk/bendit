#!/bin/bash
export TRAEFIK_CONF_PATH="/home/bendit/services"
docker compose pull
docker compose up

exit 0
