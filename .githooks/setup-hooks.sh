#!/usr/bin/env bash

# setup-hooks.sh: Install/update Git hooks from .githooks to .git/hooks (Linux/macOS)

set -euo pipefail

# ====== CONFIG ======
HOOKS_DIR=".githooks"
EXCLUDE=("setup-hooks.sh")   # List of files to skip
USE_SYMLINKS=false           # Set to true to symlink hooks (else files are copied)
# =====================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Find Git root
GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "")
if [[ -z "$GIT_ROOT" ]]; then
  echo -e "${RED}Error: Not inside a Git repository.${NC}"
  exit 1
fi

# Set destination hooks directory
DEST="$GIT_ROOT/.git/hooks"
TODAY=$(date +%F)

echo -e "${CYAN}--------------------------------------------------"
echo "🔧 Syncing Git hooks to $DEST"
echo "📅 Last Modified: $TODAY"
echo "--------------------------------------------------${NC}"

pushd "$HOOKS_DIR" > /dev/null

for SRC in *; do
  # Skip excluded files and directories
  if [[ ! -f "$SRC" ]] || [[ " ${EXCLUDE[*]} " =~ " $SRC " ]]; then
    continue
  fi

  DST="$DEST/$SRC"

  # Replace "Last Modified: {{YYYY-MM-DD}}" in both SRC and DST
  sed -i "s|Last Modified: \{\{[0-9\-]*\}\}|Last Modified: $TODAY|g" "$SRC"

  if [[ "$USE_SYMLINKS" = true ]]; then
    # Symlink, replacing existing file if needed
    if [[ -L "$DST" || -f "$DST" ]]; then
      rm -f "$DST"
    fi
    ln -s "$GIT_ROOT/$HOOKS_DIR/$SRC" "$DST"
    echo -e "${YELLOW}🔗 Symlinked:$NC $SRC → $DST"
  else
    # Copy, only if source is newer or doesn't exist
    if [[ ! -f "$DST" ]]; then
      cp "$SRC" "$DST"
      chmod +x "$DST"
      echo -e "${GREEN}📥 Copied new hook:$NC $SRC"
    elif [[ "$SRC" -nt "$DST" ]]; then
      cp "$SRC" "$DST"
      chmod +x "$DST"
      echo -e "${YELLOW}🔄 Updated hook (newer):$NC $SRC"
    else
      echo -e "${CYAN}✅ Up-to-date:$NC $SRC"
    fi
  fi

  # Update Last Modified in the destination hook as well
  sed -i "s|Last Modified: \{\{[0-9\-]*\}\}|Last Modified: $TODAY|g" "$DST"
done

popd > /dev/null
echo -e "${GREEN}--------------------------------------------------"
echo "✅ Hook installation complete.${NC}"
