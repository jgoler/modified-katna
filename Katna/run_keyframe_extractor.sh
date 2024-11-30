#!/bin/bash

# Initialize a variable to store the previous output
previous_output=()

for x in {1..100}; do
    # Run the Python script and capture its output as a space-separated string
    current_output=$(python frame_extractor_updated.py "100p.mp4" $x)

    # Convert the current output to an array
    IFS=' ' read -r -a current_output_array <<< "$current_output"

    # Loop through the current output to find numbers not in the previous output
    for number in "${current_output_array[@]}"; do
        if [[ ! " ${previous_output[@]} " =~ " ${number} " ]]; then
            echo "New number for x=$x: $number"
        fi
    done

    # Update the previous output to include the current output
    previous_output=("${current_output_array[@]}")
done
