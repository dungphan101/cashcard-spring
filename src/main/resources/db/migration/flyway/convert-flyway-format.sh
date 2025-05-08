#!/bin/bash

SRC_DIR="../"
DEST_DIR="./"

mkdir -p "$DEST_DIR"

for src_file in "$SRC_DIR"/*.sql; do

  if [ ! -f "$src_file" ]; then
    continue
  fi

  filename=$(basename "$src_file")

  new_filename="V$filename"
  dest_file="$DEST_DIR/$new_filename"

  if [ -f "$dest_file" ]; then
    echo "Skipping $filename - already exists in destination as $new_filename"
  else
    cp "$src_file" "$dest_file"
    echo "Copied $filename to flyway directory as $new_filename"
  fi
done

echo "Convert to flyway complete!"