#!/usr/bin/env bash

set -Eeufo pipefail

echo "uploading pipeline files to Buildkite..."

echo "-- sinatra.yml"

buildkite-agent pipeline upload sinatra.yml


echo "-- finish.yml"
buildkite-agent pipeline upload finish.yml