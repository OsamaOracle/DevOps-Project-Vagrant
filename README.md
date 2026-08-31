# DevOps Project Vagrant

This repository contains a Vagrantfile, a Python application, and a MinIO installation script, all containerized with Docker and orchestrated with Docker Compose.

## Prerequisites

* Vagrant
* Docker
* Docker Compose

## Instructions

### Step 1: Clone the repository

```bash
git clone https://github.com/OsamaOracle/DevOps-Project-Vagrant.git
```

### Step 2: Create the Vagrant VM

Change into the repository directory and bring the VM up:

```bash
cd DevOps-Project-Vagrant
vagrant up
```

This creates a Vagrant VM running Ubuntu 18.04.

### Step 3: Get your MinIO credentials

The Python application needs a MinIO access key and secret key. Once your MinIO instance is running, you can generate them from the MinIO console:

1. Log in to the MinIO console.
2. Open the "Access Keys" section.
3. Create a new access key and save both the access key and the secret key somewhere safe.

If you already have keys for an existing MinIO instance, you can use those instead.

### Step 4: Set up GitHub Secrets

To keep sensitive data out of the code, store it in GitHub Secrets:

1. Go to your GitHub repository.
2. Click Settings.
3. In the left sidebar, click Secrets.
4. Click New repository secret.
5. Add the following secrets:

- `MINIO_ACCESS_KEY`
- `MINIO_SECRET_KEY`
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`

For running the Python code locally, you have two options. Pick one:

**Option 1:** create a `.env` file in the same directory as the Python script:

```
MINIO_ENDPOINT=localhost:9000
MINIO_ACCESS_KEY=your_access_key
MINIO_SECRET_KEY=your_secret_key
```

**Option 2:** set the environment variables in your shell:

```bash
export MINIO_ENDPOINT=localhost:9000
export MINIO_ACCESS_KEY=your_access_key
export MINIO_SECRET_KEY=your_secret_key
python3 /vagrant/src/app/upload_to_minio.py /path/to/your/file
```

### Step 5: Build and start the Docker containers

```bash
docker-compose up -d
```

This builds the Docker images for the Python application and MinIO, then starts both containers in detached mode.

### Step 6: Access the MinIO web interface

Open the following URL in your browser:

```
http://localhost:9000
```

Log in with the access key and secret key you set earlier.

### Step 7: Run the Python application

```bash
docker-compose exec app python hello_world.py
```

This runs the Python application and uploads a file to MinIO.

## Notes

1. `MINIO_ACCESS_KEY` and `MINIO_SECRET_KEY` are not hardcoded anywhere in the code. You need to set them yourself before building and starting the containers.
2. The `docker-compose.yml` file reads `MINIO_ACCESS_KEY` and `MINIO_SECRET_KEY` from the environment to configure MinIO.

## Troubleshooting

1. If the containers fail to build or start, check the Docker logs: `docker-compose logs`
2. If the Python application fails, check its output: `docker-compose logs app`
3. If the MinIO web interface is not reachable, check the MinIO container logs: `docker-compose logs minio`
