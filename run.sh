#!/bin/bash

case $1 in
    docs)
        docker compose -f docker/docker_compose.yml run -u skytemdev docs make $2
    ;;

    *)
        echo -e "\nInvalid parameter!\n"
        echo -e "Valid parameters are:"
        echo -e "   docs"
        echo -e "i.e. ./run.sh docs html"
    ;;
esac
