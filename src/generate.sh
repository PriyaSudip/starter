#!/usr/bin/env bash
set -eu

echo "steps:"
# Create one step per directory
for d in specs/*; do
  [ -d "$d" ] || continue
  cat <<YAML
  - label: "$(basename "$d")"
    command: "$d/test.sh"
YAML
done

# Add a deploy step only on main
if [ "${BUILDKITE_BRANCH:-}" = "main" ]; then
  echo "  - wait"
  echo "  - label: \":rocket:\""
  echo "    command: \"./deploy.sh\""
fi