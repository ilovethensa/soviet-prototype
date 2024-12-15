#!/bin/bash
set -e

# Load the configuration file
source config.sh

# Create required directories
dirs=("$vanguard/sources" "$sourcedir/tools" "$vanguard/root" "$vanguard/cache" "$vanguard/image" "$ROOT/usr/ports/distfiles" "$ROOT/usr/ports/packages" "$ROOT/usr/ports/work")
for dir in "${dirs[@]}"; do
    sudo mkdir -p "$dir" || echo "couldnt create $dir"
done

# Copy necessary files and run any pre-build utilities
sudo cp -rf files/* $ROOT
bash scripts/pkgutils.sh

# Execute the build and installation loop as part of a sudo session
sudo bash build.sh
sudo bash img.sh