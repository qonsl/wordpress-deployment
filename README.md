### Build and Run the Containers ###

In the directory where your Dockerfile and docker-compose.yml are located, run:
> docker-compose build

Run the following command to start WordPress and MySQL containers:
> docker-compose up

This setup will give you a running WordPress site with a connected MySQL database, and Git will be installed on the WordPress container. You can access Git by running:
> docker exec -it <wordpress_container_name> bash

Alternatively, you can access Git where your WordPress are located near your Dockerfile and docker-compose.yml files.

### Running docker-compose up in the background: ###

> docker-compose up -d

This will start the services defined in your docker-compose.yml in the background, and you can verify that the services are running using:
> docker-compose ps

When you want to stop and terminate the services, use:
> docker-compose down

### Login Info ###
Username: admin
Password: admin_password