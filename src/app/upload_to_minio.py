# src/app/upload_to_minio.py
from minio import Minio
from minio.error import S3Error
import os

def upload_file(file_path):
    client = Minio(
        os.getenv('MINIO_ENDPOINT'),
        access_key=os.getenv('MINIO_ACCESS_KEY'),
        secret_key=os.getenv('MINIO_SECRET_KEY'),
        secure=False
    )

    bucket_name = 'mybucket'
    file_name = os.path.basename(file_path)

    if not client.bucket_exists(bucket_name):
        client.make_bucket(bucket_name)

    client.fput_object(bucket_name, file_name, file_path)
    print(f"{file_name} is successfully uploaded to {bucket_name}.")

if __name__ == '__main__':
    upload_file('/home/ubuntu')
