#!/usr/bin/env bash

set -eufo pipefail

MESSAGE="Validation succeeded!"

echo "$MESSAGE"

export slack_message="$MESSAGE"

