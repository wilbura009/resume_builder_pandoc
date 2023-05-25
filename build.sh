#!/usr/bin/env bash
# This script builds the demo folder.
# The demo folder should already have the yaml in it with sample data

print_help() {
  # Display help
  echo "Usage: ./build.sh [OPTION]"
  echo " -n, --new       create a new resume project folder"
  echo " -d, --demo      build the demo folder"
  echo " -h, --help      display this help and exit"
}

# Handle cmd line args
case "$1" in
  -n|--new)
    # Create a new project folder
    read -rp "Enter the name of the new resume project folder: " new_resume_dir
    mkdir "$new_resume_dir" || exit 1
    mkdir "$new_resume_dir/yaml" || exit 1
    cp -r src/components src/resume_template.tex src/makefile "$new_resume_dir"
    cp -r src/demo/yaml/resume.yaml "$new_resume_dir/yaml"
    ;;

  -d|--demo)
    # Create the demo folder if it doesn't exist
    if [ ! -d "./demo" ]; then
      mkdir demo || exit 1
    fi
    # Create the yaml folder if it doesn't exist
    if [ ! -d "./demo/yaml" ]; then
      mkdir demo/yaml || exit 1
    fi
    # Copy the files to the demo folder
    cp -r src/components src/makefile src/resume_template.tex demo
    cp -r src/demo/yaml/resume.yaml demo/yaml
    # Build the demo folder
    cd ./demo && make resume
    ;;

  -h|--help)
    print_help
    ;;

  *)
    print_help
    ;;
esac
