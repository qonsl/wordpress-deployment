#!/bin/bash

# Wait for the database to be ready
echo "Waiting for MySQL..."
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    sleep 1
done
echo "MySQL is up and running!"

# Check if WordPress is already installed
if ! $(wp core is-installed --allow-root); then
  echo "Installing WordPress..."

  # Install WordPress
  wp core install \
    --url="${WORDPRESS_SITE_URL}" \
    --title="${WORDPRESS_SITE_TITLE}" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
    --skip-email \
    --allow-root

  # Set language
  wp language core install "${WORDPRESS_LOCALE}" --activate --allow-root
  echo "WordPress installed successfully!"
else
  echo "WordPress already installed!"
fi

# Start Apache (default command)
apache2-foreground
