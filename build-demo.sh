#!/usr/bin/env bash
# This script builds the demo folder.

# The demo folder should already have the yaml in it with sample data

# Copy the files to the demo folder
cp -rv src/components src/makefile src/template.tex demo

# Build the demo folder
cd ./demo && make
