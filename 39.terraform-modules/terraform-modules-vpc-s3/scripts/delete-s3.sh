#!/bin/bash

S3_BUCKET_NAME="deens3backend"

# Delete all objects from S3 bucket before deleting the bucket itself
Echo "Deleting all objects from S3 bucket: $S3_BUCKET_NAME ..."

aws s3 rm s3://$S3_BUCKET_NAME --recursive

# delete S3 bucket
Echo "Deleting S3 bucket: $S3_BUCKET_NAME ..."
aws s3api delete-bucket \
  --bucket $S3_BUCKET_NAME \
  --region us-west-2

Echo "S3 bucket $S3_BUCKET_NAME deleted."