#!/bin/bash

# Load environment variables from the .env file
export $(grep -v '^#' /home/vagrant/.env | xargs)

# Navigate to the project directory
cd /vagrant

# Deploy the containers using Docker Compose
docker-compose up -d
