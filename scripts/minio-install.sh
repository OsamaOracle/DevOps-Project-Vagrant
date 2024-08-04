# scripts/install_minio.sh
#!/bin/bash
docker pull minio/minio
mkdir -p ~/minio/data
docker run -d --name minio -p 9000:9000 -p 9001:9001 -v ~/minio/data:/data -e "MINIO_ROOT_USER=${MINIO_ACCESS_KEY}" -e "MINIO_ROOT_PASSWORD=${MINIO_SECRET_KEY}" minio/minio server /data --console-address ":9001"
