# Base the image on the official WordPress image
FROM wordpress:latest

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory to WordPress
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Default command to start the server
CMD ["apache2-foreground"]

