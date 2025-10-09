#!/bin/bash
export TRAEFIK_CONF_PATH="/home/bendit/services"
export BENDIT_STATIC_CONTENT_PATH="/home/bendit/services/static"

export BENDIT_UID=$( getent passwd docker | cut -d: -f3 )
export BENDIT_GID=$( getent group docker | cut -d: -f3 )

docker network create proxy
docker compose down
docker compose up -d

exit 0
