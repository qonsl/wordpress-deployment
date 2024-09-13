Build and Run the Containers

In the directory where your Dockerfile and docker-compose.yml are located, run:

docker-compose build

Run the following command to start WordPress and MySQL containers:

docker-compose up

This setup will give you a running WordPress site with a connected MySQL database, and Git will be installed on the WordPress container. You can access Git by running:
docker exec -it <wordpress_container_name> bash

Alternatively, you can access Git where your WordPress are located near your Dockerfile and docker-compose.yml files.
