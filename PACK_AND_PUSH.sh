#!/usr/bin/env bash
# PACK_AND_PUSH.sh — commit and publish the Z550i archive to GitHub
# Usage: ./PACK_AND_PUSH.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

BRANCH="main"
REMOTE_NAME="origin"
REPO_NAME="z550i-complete-pack"
REPO_DESC="Sony Ericsson Z550i complete preservation archive — firmware, patches, tools, elfpack, acoustics, and source dumps"
RELEASE_TAG="v1.0.0"
RELEASE_TITLE="v1.0.0 — Z550i Complete Preservation Archive"

# Files >90MB go as release assets, not git blobs
LARGE_FILES=(
  "_sources/SE-NSE.rar"
)

echo "=== [1/6] Git setup ==="
git checkout -b "$BRANCH" 2>/dev/null || git checkout "$BRANCH"
git add -A
git commit -m "Z550i complete preservation archive v1.0.0

435 MB, ~3370 files: firmware (R6CA009 MAIN+FS+CUST), 19+12 vkp patches,
ElfPack + 15 .elf binaries, all flashing tools, acoustic packs, and
original source dumps. See INDEX.md for full manifest."

echo ""
echo "=== [2/6] Create GitHub repo ==="
if ! gh repo view "$REPO_NAME" --json name >/dev/null 2>&1; then
  gh repo create "$REPO_NAME" \
    --public \
    --description "$REPO_DESC" \
    --source . \
    --remote "$REMOTE_NAME" \
    --push
  echo "Repo created and pushed."
else
  echo "Repo already exists, adding remote..."
  git remote add "$REMOTE_NAME" "https://github.com/winmasttdev/$REPO_NAME.git" 2>/dev/null || \
    git remote set-url "$REMOTE_NAME" "https://github.com/winmasttdev/$REPO_NAME.git"
  git push -u "$REMOTE_NAME" "$BRANCH"
fi

echo ""
echo "=== [3/6] Create release ==="
if ! gh release view "$RELEASE_TAG" --repo "winmasttdev/$REPO_NAME" >/dev/null 2>&1; then
  gh release create "$RELEASE_TAG" \
    --repo "winmasttdev/$REPO_NAME" \
    --title "$RELEASE_TITLE" \
    --notes-file RELEASE_NOTES.md
  echo "Release created."
else
  echo "Release $RELEASE_TAG already exists, skipping."
fi

echo ""
echo "=== [4/6] Upload large files as release assets ==="
for f in "${LARGE_FILES[@]}"; do
  if [ -f "$f" ]; then
    echo "Uploading $f ($(du -h "$f" | cut -f1))..."
    gh release upload "$RELEASE_TAG" "$f" \
      --repo "winmasttdev/$REPO_NAME" \
      --clobber
  fi
done

echo ""
echo "=== [5/6] Verify ==="
echo "Repo:    https://github.com/winmasttdev/$REPO_NAME"
echo "Release: https://github.com/winmasttdev/$REPO_NAME/releases/tag/$RELEASE_TAG"
echo "Files in repo: $(git ls-files | wc -l)"
echo "Release assets:"
gh release view "$RELEASE_TAG" --repo "winmasttdev/$REPO_NAME" --json assets \
  | jq -r '.assets[] | "  \(.name) (\(.size / 1048576 | floor) MB)"'

echo ""
echo "=== [6/6] Done ==="
