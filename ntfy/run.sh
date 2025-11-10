#!/usr/bin/with-contenv bashio

bashio::log.info "Starting ntfy.sh server..."

BASE_URL=$(bashio::config 'base_url')
AUTH_DEFAULT=$(bashio::config 'auth_default')

bashio::log.info "Config:"
bashio::log.info "  base_url    = ${BASE_URL:-<none>}"
bashio::log.info "  auth_default= ${AUTH_DEFAULT:-read-write}"

ARGS=""

if bashio::var.has_value "$BASE_URL"; then
    ARGS="$ARGS --base-url=$BASE_URL"
fi

if bashio::var.has_value "$AUTH_DEFAULT"; then
    ARGS="$ARGS --auth-default-access=$AUTH_DEFAULT"
fi

bashio::log.info "Running: ntfy $ARGS"

exec ntfy serve $ARGS
