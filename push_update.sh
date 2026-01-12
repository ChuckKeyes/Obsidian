#!/bin/bash

# go to your Obsidian vault
# cd "/d/New Obsidian/New Obsidian"

# always pull first
git pull

# stage all changes (new folders, files, edits, deletions)
git add .

# commit with a timestamp
git commit -m "Update on $(date)"

# push to GitHub
git push

echo "Done! Vault updated and pushed to GitHub."
