#!/bin/bash

target_version=${VERSION:-latest}

for migration_file in $(find migrations/*.sql | sort -V); do

    if [[ "$target_version" != "latest" ]]; then

        version=$(basename "$migration_file" | cut -d'.' -f1,2,3)
        
        IFS='.' read -r -a version_parts <<< "$version"
        version_major="${version_parts[0]}"
        version_minor="${version_parts[1]}"
        version_patch="${version_parts[2]}"
        
        IFS='.' read -r -a target_parts <<< "$target_version"
        target_major="${target_parts[0]}"
        target_minor="${target_parts[1]}"
        target_patch="${target_parts[2]}"
        

        if (( version_major > target_major || (version_major == target_major && version_minor > target_minor) || 
             (version_major == target_major && version_minor == target_minor && version_patch > target_patch) )); then
            break
        fi
    fi

    echo "Applying migration: $migration_file"
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$migration_file"
done

echo "Migration complete. Current version: $target_version."


