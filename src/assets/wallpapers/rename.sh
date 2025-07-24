#!/bin/bash

# Counter for naming files
count=1

# Loop through all png files in the current directory
for file in *.png; do
    # Skip if the file is already named in the desired format
    if [[ $file =~ ^wall_[0-9]+\.png$ ]]; then
        continue
    fi
    
    # Rename the file
    mv "$file" "wall_$count.png"
    
    # Increment the counter
    ((count++))
done

echo "Renaming complete!"
