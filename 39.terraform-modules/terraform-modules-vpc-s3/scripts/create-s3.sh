#!/bin/bash

S3_BUCKET_NAME="deens3backend"


# Create S3 bucket with region configuration

Echo "Creating S3 bucket: $S3_BUCKET_NAME ..."
aws s3api create-bucket \
  --bucket $S3_BUCKET_NAME \
  --region us-west-2 \
  --create-bucket-configuration LocationConstraint=us-west-2
Echo "S3 bucket $S3_BUCKET_NAME created."