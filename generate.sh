#!/bin/bash

# Directory containing the fragments
FRAGMENTS_DIR="./compose-fragments"

# Base fragment that will always be included
BASE_FRAGMENT="base.yml"

# Output file
OUTPUT_FILE="docker-compose.yml"

# Function to add a fragment to the output file
add_fragment() {
  echo "# Including fragment: $1" >>"$OUTPUT_FILE"
  cat "$FRAGMENTS_DIR/$1" >>"$OUTPUT_FILE"
  echo "" >>"$OUTPUT_FILE" # Add a newline for readability
}

# Start with an empty output file
>"$OUTPUT_FILE"

# Always include the base fragment first
add_fragment "$BASE_FRAGMENT"

if [ "$1" == "--all" ]; then
  # Include all fragments except the base fragment
  for fragment in "$FRAGMENTS_DIR"/*.yml; do
    fragment_name=$(basename "$fragment")
    # Skip the base fragment; we already added it
    if [ "$fragment_name" != "$BASE_FRAGMENT" ]; then
      add_fragment "$fragment_name"
    fi
  done
else
  # Include only the specified fragments, and only if they exist
  for fragment in "$@"; do
    if [ -f "$FRAGMENTS_DIR/$fragment.yml" ]; then
      add_fragment "$fragment.yml"
    else
      echo "Warning: Fragment $fragment.yml not found, skipping." >&2
    fi
  done
fi

echo "Docker Compose file generated: $OUTPUT_FILE"
