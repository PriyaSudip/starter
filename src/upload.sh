#!/bin/bash

set -e

echo "Uploading"

buildkite-agent pipeline upload <<YAML
steps:
  - label: ":rocket: Upload"
    command: "echo 'Uploading'"
    key: "two"
YAML