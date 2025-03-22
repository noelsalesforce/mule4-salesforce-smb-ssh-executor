#!/bin/bash
cd z

# Function to generate a random string of 5 characters
generate_name() {
  LC_ALL=C tr -dc 'a-zA-Z' < /dev/urandom | head -c 5
}

# Function to create a folder and files recursively
create_structure() {
  local parent_dir="$1"
  local depth="$2"
  
  # If we've reached the desired depth, stop recursion
  if [ "$depth" -gt 3 ]; then
    return
  fi
  
  mkdir -p "$parent_dir"
  
  # Create 3 folders at this level
  for i in {1..3}; do
    folder_name=$(generate_name)
    create_structure "$parent_dir/$folder_name" $((depth + 1))
  done
  
  # Create 3 files at this level, each with random 1KB data
  for i in {1..3}; do
    file_name=$(generate_name)
    file_path="$parent_dir/$file_name.txt"
    
    # Generate a 1KB random file (1024 bytes)
    head -c 1024 /dev/urandom > "$file_path"
  done
}

# Check if the argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parent_folder_name>"
  exit 1
fi

# Get the parent folder name from the argument
parent_folder="$1"

# Create the parent folder and the structure
create_structure "$parent_folder" 1
