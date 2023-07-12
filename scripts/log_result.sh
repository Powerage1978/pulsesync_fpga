#!/bin/bash

GREEN=$(tput -Txterm setaf 2)
YELLOW=$(tput -Txterm setaf 3)
WHITE=$(tput -Txterm setaf 7)
RESET=$(tput -Txterm sgr0)

echo -e ""
echo "${YELLOW}****** $1 status ******${RESET}"
echo -e ""
echo -e "${YELLOW}WARNINGS:${RESET} $(grep -c '^WARNING' log/$1.log)"
echo -e "${YELLOW}CRITICAL-WARNINGS:${RESET} $(grep -c '^CRITICAL WARNING' log/$1.log)"
echo -e "${YELLOW}ERRORS:${RESET} $(grep -c '^ERROR' log/$1.log)"
echo -e ""
