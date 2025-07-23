#!/bin/bash

set -e

echo "--- Tagging and pushing to main Account"

docker build -t my-app:latest .

docker tag my-app:latest 097340723131.dkr.ecr.us-east-1.amazonaws.com/my-app:latest

aws ecr get-login-password --region us-east-1 \
docker login --username AWS --password-stdin 097340723131.dkr.ecr.us-east-1.amazonaws.com

docker push 097340723131.dkr.ecr.us-east-1.amazonaws.com/my-app:latest

 echo "--- Tagging and pushing to Account app account"
export AWS_DEFAULT_REGION=ap-southeast-2

aws ecr get-login-password --region ap-southeast-2 \
docker login --username AWS --password-stdin 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com

docker tag my-app:latest 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com/my-app:latest
docker push 097340723131.dkr.ecr.ap-southeast-2.amazonaws.com/my-app:latest