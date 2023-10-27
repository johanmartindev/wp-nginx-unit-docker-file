# Creating Wordpress Image
## Setup
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
