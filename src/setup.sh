#!/usr/bin/env bash

set -Eeufo pipefail

echo "uploading pipeline files to Buildkite..."

echo "-- sinatra.yml"

buildkite-agent pipeline upload ./src/sinatra.yml


echo "-- finish.yml"
buildkite-agent pipeline upload ./src/finish.yml