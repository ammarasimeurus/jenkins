#!/bin/bash

# Create a file to store the versions
output_file="latest_versions.txt"
> "$output_file"

# Iterate through all installed packages and get their versions
for package in $(dpkg -l | grep ^ii | awk '{print $2}'); do
    version=$(apt show "$package" 2>/dev/null | grep -E "^Version:" | awk '{print $2}')
    
    if [ -n "$version" ]; then
        echo "$package: $version" >> "$output_file"
    else
        echo "Failed to get version for $package."
    fi
done

echo "Latest versions for all installed packages saved to $output_file"
