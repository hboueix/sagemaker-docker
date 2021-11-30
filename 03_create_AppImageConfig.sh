#!/bin/bash

REGION=$(aws configure get region)
REGION=${REGION:-eu-west-1}
JSON_INPUT=file://app-image-config-input.json

aws --region ${REGION} sagemaker create-app-image-config --cli-input-json ${JSON_INPUT}