#!/usr/bin/env bash

set -eufo pipefail

MESSAGE="Validation succeeded!"

echo "$MESSAGE"



export SLACK_MESSAGE=$MESSAGE


echo "MESSAGE=$SLACK_MESSAGE"

