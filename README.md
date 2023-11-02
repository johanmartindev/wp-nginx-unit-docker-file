# Creating Wordpress Image
!!! Ignore below. Will update as necessary. This is to build a docker image using nginx unit for wordpress and push to a docker registry.
## Development Setup
1. Make a new developer folder `mkdir wp-dev`.
  1. Change into folder `cd wp-dev`
  1. Checkout this repo into the folder with the `.devcontainer` as the name.
  * `git clone git@github.com:johanmartindev/wp-devcontainer.git .devcontainer`
  1. Check the Wordpress repo into this folder.
  * `git@github.com:johanmartindev/wp-nginx-unit-docker-file.git wordpress`
  1. Open vscode. `code .` or via menu in vs code.
  1. Start vscode devcontainer
1. Setup WordPress site
```sh
composer update # update local packages
composer install # install composer config

wp db reset --yes # Clear the database

wp core install --url=${DOMAIN_CURRENT_SITE} --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev --debug

wp core multisite-install --url=${DOMAIN_CURRENT_SITE}  --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev

wp plugin activate woocommerce --network

wp core update-db --network
wp server --port=8000 --debug --color --host=127.0.0.1
```

## Build docker image
* `cp example.env .env`
* `docker-compose up -d`
## Nginx Unit
* https://unit.nginx.org
  * https://unit.nginx.org/installation/#docker-amazonecrpublicgallery
  * public.ecr.aws/nginx/unit:1.28.0-php8.1 - Current image I'm using
## PHP Composer File
  * https://wpackagist.org

## WordPress Config

## Setup Errors
* Docker mysql ERROR 1396 (HY000): Operation CREATE USER failed for 'root'@'%'
  * or just change the MYSQL_USER to anything different i.e. MYSQL_USER=shoot incase if different user is needed –
Muhammad Sheraz
 Aug 3, 2021 at 17:41
  * https://stackoverflow.com/questions/45086162/docker-mysql-error-1396-hy000-operation-create-user-failed-for-root
