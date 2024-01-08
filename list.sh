#!/bin/bash

# Iterate through installed packages and extract version information
dpkg -l | grep '^ii' | awk '{print $2}' | while read -r package; do
    version=$(dpkg-query -W -f='${Version}' "$package" 2>/dev/null)
    [ -n "$version" ] && echo "$package: $version"
done
