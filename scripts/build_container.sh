#!/bin/bash

case $1 in
    build)
        GID_V=$(id -g) UID_V=$(id -u) docker compose -f docker/docker_compose.yml build
    ;;
    
    down)
        docker compose -f docker/docker_compose.yml down
    ;;

    ls)
        docker compose -f docker/docker_compose.yml ls
    ;;

    *)
        echo -e "\nInvalid parameter!\n"
        echo -e "Valid parameters are:"
        echo -e "  build"
        echo -e "  down"
        echo -e "  ls\n"
    ;;
esac
      