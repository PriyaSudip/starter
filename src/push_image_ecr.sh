#!/bin/bash

set -e

echo "--- Tagging and pushing to main Account $AWS_DEFAULT_REGION"



docker build -t my-app:$BUILDKITE_BUILD_NUMBER .

docker tag my-app:$BUILDKITE_BUILD_NUMBER 097340723131.dkr.ecr.us-east-1.amazonaws.com/my-app:latest

docker push 097340723131.dkr.ecr.us-east-1.amazonaws.com/my-app:latest

export AWS_DEFAULT_REGION=${APP_ACCOUNT_REGION:-"ap-southeast-2"}
echo "--- Tagging and pushing to Account app account $AWS_DEFAULT_REGION"


aws ecr get-login-password --region ap-southeast-2 |
docker login --username AWS --password-stdin 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com

docker tag my-app:$BUILDKITE_BUILD_NUMBER 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com/my-app:latest
docker push 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com/my-app:latest