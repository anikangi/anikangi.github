#!/bin/bash

# Path to Pandoc executable
PANDOC_PATH="C:\Program Files\Pandoc\pandoc.exe"

# Source directory for Markdown files
SOURCE_DIR="src"

# Build directory for HTML files
BUILD_DIR="build"

# Temporary directory for intermediate files
TEMP_DIR="temp"

# Index file name
INDEX_FILE="index.html"

# Create temporary directory if not exists
mkdir -p "$TEMP_DIR"

# Loop through Markdown files in source directory
for file in "$SOURCE_DIR"/*.md; do
  # Extract filename without extension
  filename=$(basename "$file" .md)

  # Convert Markdown to HTML
  "$PANDOC_PATH" -s "$file" -o "$TEMP_DIR/$filename.html"

  # Check if conversion was successful
  if [ $? -eq 0 ]; then
    echo "Converted $filename.md to $filename.html"

    # Append converted HTML to index file
    echo "<a href=\"$filename.html\">$filename</a><br>" >> "$TEMP_DIR/$INDEX_FILE"
  else
    echo "Error converting $filename.md to HTML"
  fi
done

# Move converted HTML files to build directory
mv "$TEMP_DIR"/*.html "$BUILD_DIR"

# Move index file to build directory
mv "$TEMP_DIR/$INDEX_FILE" "$BUILD_DIR"

# Clean up temporary directory
rm -rf "$TEMP_DIR"
