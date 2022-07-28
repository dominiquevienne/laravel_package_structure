#!/bin/bash

LIGHT_GREEN="\e[92m"
ENDCOLOR="\e[0m"

GITKEEP=".gitkeep"

DIRECTORIES_TO_CREATE=(
    "database/seeders"
    "resources/lang/en"
    "routes"
    "src/Exceptions"
    "src/Http/Controllers"
    "src/Http/Filters"
    "src/Http/Middleware"
    "src/Http/Requests"
    "src/Mail"
    "src/Models"
    "src/Services"
    "src/Traits"
)

if [[ "$1" != "" ]]; then
    DIR="$1"
    if [[ "${DIR: -1}" != "/" ]]; then
        DIR="${DIR}/"
    fi
else
    echo "You need to provide a target directory"
    echo "Usage: ./create-dirs ../my-laravel-project"
    exit 0
fi

echo -e "Creating skeleton in ${LIGHT_GREEN}${DIR}${ENDCOLOR}"
echo

for i in "${!DIRECTORIES_TO_CREATE[@]}"; do
    mkdir -p "${DIRECTORIES_TO_CREATE[i]}"
    touch "${DIRECTORIES_TO_CREATE[i]}/${GITKEEP}"
    echo "${DIRECTORIES_TO_CREATE[i]} ...... Directory created"
done
