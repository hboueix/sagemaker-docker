#!/bin/bash

REGION=$(aws configure get region)
REGION=${REGION:-eu-west-1}
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

REPOSITORY=test-ecr
IMAGE_NAME=custom-env-kernel-alpine

FULL_ECRNAME="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY}"

# Build and push the image
echo "Building image ${IMAGE_NAME}..."
docker build . -t ${IMAGE_NAME} -t ${FULL_ECRNAME}:${IMAGE_NAME}
echo "Done."

if [[ $? -eq 0 ]] && [[ $1 = "push" ]]; then
    aws --region ${REGION} ecr get-login-password | docker login --username AWS --password-stdin ${FULL_ECRNAME}
    echo "Pushing image ${IMAGE_NAME} to ${FULL_ECRNAME}..."
    docker push ${FULL_ECRNAME}:${IMAGE_NAME}
    echo "Done."

elif [[ $1 != "push" ]]; then
    echo "You can push your image on ECR with 'push' argument."
    echo "Usage example:    ./01_build_image.sh [push]"
fi

