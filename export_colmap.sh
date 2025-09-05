#!/bin/bash

# OpenSFM COLMAP Export Script
# Usage: ./export_colmap.sh <opensfm_dataset_directory> [--binary]

# Check if directory argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <opensfm_dataset_directory> [--binary]"
    echo "Example: $0 /path/to/opensfm_dataset"
    echo "Example: $0 /path/to/opensfm_dataset --binary"
    exit 1
fi

DIR_OSFM="$1"
OPENSFM_BIN="./SuperBuild/install/bin/opensfm/bin/opensfm"

# Check if OpenSFM binary exists
if [ ! -f "$OPENSFM_BIN" ]; then
    echo "Error: OpenSFM binary not found at $OPENSFM_BIN"
    exit 1
fi

# Check if input directory exists
if [ ! -d "$DIR_OSFM" ]; then
    echo "Error: Directory $DIR_OSFM does not exist"
    exit 1
fi

# Run export_colmap command
echo "Exporting OpenSFM dataset to COLMAP format..."
echo "Input directory: $DIR_OSFM"

if [ "$2" = "--binary" ]; then
    echo "Output format: Binary"
    "$OPENSFM_BIN" export_colmap "$DIR_OSFM" --binary
else
    echo "Output format: Text"
    "$OPENSFM_BIN" export_colmap "$DIR_OSFM"
fi

if [ $? -eq 0 ]; then
    echo "Export completed successfully!"
    echo "Output directory: $DIR_OSFM/colmap_export"
else
    echo "Export failed!"
    exit 1
fi