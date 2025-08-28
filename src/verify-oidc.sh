#!/bin/bash

set -eu


singing_key=123
echo "Verifying OIDC token..."
buildkite-agent oidc request-token --audience sts.amazonaws.com

echo "Requesting OIDC token with claim..."

buildkite-agent oidc request-token ... --claim $singing_key

echo    "Requesting OIDC token without claim..."
buildkite-agent oidc request-token --audience sts.amazonaws.com
