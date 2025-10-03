#!/bin/bash

set -eu

# Set pipeline-wide priority based on branch
if [[ "$BUILDKITE_BRANCH" == "main" ]]; then
  export PIPELINE_PRIORITY=100
else
  export PIPELINE_PRIORITY=200
fi

echo "steps:"
echo "  - command: \"echo Running with PIPELINE_PRIORITY=\$PIPELINE_PRIORITY\""
