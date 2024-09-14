# Base the image on the official WordPress image
FROM wordpress:latest

# Install Git and WP-CLI
RUN apt-get update && apt-get install -y git less mariadb-client \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Set the working directory to WordPress
WORKDIR /var/www/html

# Copy script to the container
COPY setup-wordpress.sh /usr/local/bin/setup-wordpress.sh
RUN chmod +x /usr/local/bin/setup-wordpress.sh

# Expose port 80
EXPOSE 80

# Default command to start the server and configure WordPress
CMD ["sh", "/usr/local/bin/setup-wordpress.sh"]
