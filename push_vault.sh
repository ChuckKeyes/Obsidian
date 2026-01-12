#!/usr/bin/env bash
set -e  # stop on first error

# 1. Go to your Obsidian vault (this MUST be the folder that has .git)
cd "/d/New Obsidian/New Obsidian"

# 2. Always pull first
git pull

# 3. Stage all changes (new folders, files, edits, deletions)
git add .

# 4. Commit only if there is something to commit
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "Update on $(date)"
fi

# 5. Push to GitHub
git push

echo "Done! Vault updated and pushed to GitHub."
