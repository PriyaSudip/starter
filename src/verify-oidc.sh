#!/bin/bash

set -eu


singing_key=123
echo "Verifying OIDC token..."
$ buildkite-agent oidc request-token --audience sts.amazonaws.com
$ buildkite-agent oidc request-token ... --claim $singing_key
$ buildkite-agent oidc request-token --audience sts.amazonaws.com
