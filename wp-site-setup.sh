#!/usr/bin/env bash
set -Eeuo pipefail
cd /site
wait-for-it ${WORDPRESS_DB_HOST}:${WORDPRESS_DB_PORT} -s
wp --info --allow-root

if ! wp core is-installed --network --allow-root; then
  wp core multisite-install --url=${DOMAIN_CURRENT_SITE} --title="${SITE_TITLE}" --admin_user=admin --admin_password=randomtest --admin_email=info@johanmartin.dev --allow-root
fi

if wp plugin is-installed woocommerce --allow-root; then
  if ! wp plugin is-active woocommerce --network --allow-root; then
    wp plugin activate woocommerce --network --allow-root
  fi
fi

wp core update-db --network --allow-root
exec "$@"
