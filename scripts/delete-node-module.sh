#!/bin/bash

# Function to recursively find and delete "node_modules" directories
delete_node_modules() {
  local dir="$1"

  # Loop through all subdirectories
  for d in "$dir"/*/; do
    if [ -d "$d" ]; then
      # Check if the directory is named "node_modules"
      if [ "$(basename "$d")" == "node_modules" ]; then
        # Delete the "node_modules" directory
        echo "Deleting: $d"
        rm -rf "$d"
      else
        # Recursively call the function for subdirectories
        delete_node_modules "$d"
      fi
    fi
  done
}

# Start the search and deletion from the current directory
delete_node_modules "."

echo "Search and deletion completed."
