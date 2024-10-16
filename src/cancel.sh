#!/bin/bash

# Define your GraphQL endpoint
GRAPHQL_ENDPOINT="https://your-graphql-endpoint.com/graphql"

buildkite-agent meta-data get "job-to-cancel" > job
echo "Job ID: $job"

GRAPHQL_QUERY='mutation CancelJob {
  jobTypeCommandCancel(input: { id: $job }) {
    jobTypeCommand {
      id
    }
  }
}'

# Define headers (optional, depending on your API's requirements)
AUTH_TOKEN="your-auth-token"  # replace this with your actual token
HEADERS=(
  -H "Content-Type: application/json"
  -H "Authorization: Bearer $AUTH_TOKEN"  # only include this if your API requires authentication
)

# Make the HTTP POST request using curl
RESPONSE=$(curl -s -X POST "${GRAPHQL_ENDPOINT}" \
  "${HEADERS[@]}" \
  -d "${GRAPHQL_QUERY}")

# Output the response
echo "GraphQL Response: $RESPONSE"
