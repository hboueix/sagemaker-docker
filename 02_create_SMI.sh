#!/bin/bash

REGION=$(aws configure get region)
REGION=${REGION:-eu-west-1}
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

REPOSITORY=test-ecr
IMAGE_NAME=custom-env-kernel-alpine

FULL_ECRNAME="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY}"

# Role in your account to be used for SMI. Modify as required.
ROLE_ARN=arn:aws:iam::${ACCOUNT_ID}:role/service-role/AmazonSageMaker-ExecutionRole-20211129T170160
aws --region ${REGION} sagemaker create-image \
    --image-name ${IMAGE_NAME} \
    --role-arn ${ROLE_ARN}

aws --region ${REGION} sagemaker create-image-version \
    --image-name ${IMAGE_NAME} \
    --base-image "${FULL_ECRNAME}:${IMAGE_NAME}"

# Verify the image-version is created successfully. Do NOT proceed if image-version is in CREATE_FAILED state or in any other state apart from CREATED.
aws --region ${REGION} sagemaker describe-image-version --image-name ${IMAGE_NAME}