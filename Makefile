SHELL := /bin/bash

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

.DEFAULT_GOAL := help

include docs/Makefile
include dev/Makefile

## Help:
help: ## Show this help
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
                        if (/^[0-9a-zA-Z_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-25s${GREEN}%s${RESET}\n", $$1, $$2} \
                        else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
                        }' $(MAKEFILE_LIST)



