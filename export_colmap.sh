#!/bin/bash

# OpenSFM COLMAP Export Script
# Usage: ./export_colmap.sh

# 직접 설정할 경로와 옵션들
:<<END
DIR_OSFM="/mnt/hdd_16tb/datas/sillim_ew/opensfm"
USE_BINARY=true  # true면 바이너리, false면 텍스트
END

DIR_OSFM="/data/sillim_ew_copied/opensfm"
USE_BINARY=false  # true면 바이너리, false면 텍스트

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

if [ "$USE_BINARY" = true ]; then
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
