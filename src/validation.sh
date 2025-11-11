#!/usr/bin/env bash

set -eufo pipefail

MESSAGE="Validation succeeded!"

echo "$MESSAGE"

buildkite-agent meta-data set slack_message "$MESSAGE"
