# DevOps Project Vagrant

This repository contains a Vagrantfile, a Python application, and a MinIO installation script, all containerized using Docker and orchestrated using Docker Compose.

## Prerequisites

* Vagrant
* Docker
* Docker Compose

## Instructions

### Step 1: Clone the repository

Clone this repository using the following command:

```bash
git clone https://github.com/OsamaOracle/DevOps-Project-Vagrant.git

```
###  Step 2: Create a Vagrant VM

Change into the repository directory and create a Vagrant VM using the following command:

    cd devops-project
    vagrant up

This will create a new Vagrant VM with Ubuntu 18.04.

### Step 3: Create a MinIO account

**You can obtain these values by creating a MinIO account or by using an existing one. To create a new MinIO account, follow these steps:
**
1. Go to the MinIO website and click on "Sign Up".
2. Fill in the registration form and click on "Create Account".
3. Verify your email address by clicking on the link sent by MinIO.
4. Log in to your MinIO account and go to the "Account" page.
5. Click on "Security" and then on "Access Keys".
6. Create a new access key and note down the access key and secret key.
7. Alternatively, you can use an existing MinIO account and obtain the access key and secret key from the MinIO console.

### Step 4: Setting Up GitHub Secrets

**To use GitHub Secrets for sensitive data, follow these steps:
**

1. Go to your GitHub repository.
2. Click on Settings.
3. In the left sidebar, click on Secrets.
4. Click on New repository secret.
5. Add the following secrets:


- MINIO_ACCESS_KEY

- MINIO_SECRET_KEY

- DOCKER_USERNAME

- DOCKER_PASSWORD


### Step 5: Build and start the Docker containers

Build and start the Docker containers using the following command:

    docker-compose up -d
	
	This will build the Docker images for the Python application and MinIO, and start the containers in detached mode.

### Step 6: Access the MinIO web interface

Access the MinIO web interface using the following URL:

    http://localhost:9000

You can log in to the MinIO console using the access key and secret key you set earlier.

### Step 7: Run the Python application

Run the Python application using the following command:

    docker-compose exec app python hello_world.py
    
This will run the Python application and upload a file to MinIO.

##### Notes

1. The MINIO_ACCESS_KEY and MINIO_SECRET_KEY environment variables are not hardcoded in the code. You need to set these variables manually before building and starting the Docker containers.
2. The docker-compose.yml file uses the MINIO_ACCESS_KEY and MINIO_SECRET_KEY environment variables to set the access key and secret key for MinIO.

##### Troubleshooting

1. If you encounter any issues while building or starting the Docker containers, check the Docker logs for errors.
2. If you encounter any issues while running the Python application, check the Python logs for errors.
3. If you encounter any issues while accessing the MinIO web interface, check the MinIO logs for errors.


