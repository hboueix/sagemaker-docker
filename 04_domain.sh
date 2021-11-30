#!/bin/bash

REGION=$(aws configure get region)
REGION=${REGION:-eu-west-1}

CREATE_INPUT=file://create-domain-input.json
UPDATE_INPUT=file://update-domain-input.json
DOMAIN_ID=d-8y7sj35qea9e

if [[ $1 = "create" ]]; then
    aws --region ${REGION} sagemaker create-domain --cli-input-json ${CREATE_INPUT}

elif [[ $1 = "update" ]]; then
    aws --region ${REGION} sagemaker update-domain --cli-input-json ${UPDATE_INPUT}

else
    echo "You need to pass either 'create' or 'update' argument."
    echo "Usage:    ./04_domain.sh create|update"

fi