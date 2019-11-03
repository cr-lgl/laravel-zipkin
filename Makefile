.PHONY: start
start: erase build up ## clean current environment, recreate dependencies and spin up again

.PHONY: rebuild
rebuild: start ## same as start

.PHONY: erase
erase: ## stop and delete containers, clean volumes.
		docker-compose stop
		docker-compose rm -v -f

.PHONY: build
build: ## build environment and initialize composer and project dependencies
		docker-compose build

.PHONY: up
up: ## spin up environment
		docker-compose up -d
		docker-compose exec service-a composer run post-root-package-install
		docker-compose exec service-a composer install --no-interaction
		docker-compose exec service-b composer run post-root-package-install
		docker-compose exec service-b composer install --no-interaction

.PHONY: key
key: ## generate app key
		docker-compose exec service-a composer run post-create-project-cmd
		docker-compose exec service-b composer run post-create-project-cmd
