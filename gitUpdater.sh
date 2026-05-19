#!/bin/bash

# Variables
VAULT_DIR="$HOME/Documents/CODE/$1"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

cd "$VAULT_DIR" || { echo "Error: $VAULT_DIR NOT FOUND"; exit 1; }   

# 3. Verify if there are changes to commit
if [[ -z $(git status --porcelain) ]]; then
    echo "No changes to sync."
    exit 0
fi

# 4. Execute the synchronization
echo "Synchronizing changes..."
git add . > /dev/null 2>&1
git commit -m "Auto-sync: $TIMESTAMP" > /dev/null 2>&1
git push > /dev/null 2>&1

echo "Notes updated correctly on $TIMESTAMP"
