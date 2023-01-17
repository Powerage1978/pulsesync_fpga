#!/bin/bash

GID_V=$(id -g) UID_V=$(id -u) docker compose -f docker/docker-compose.yml build