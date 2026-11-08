#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.local/bin"

mkdir -p "$TARGET_DIR"
ln -sf "${SCRIPT_DIR}/lens-translate" "${TARGET_DIR}/lens-translate"

echo "✅ Successfully linked 'lens-translate' to ${TARGET_DIR}/lens-translate"
echo ""
echo "To trigger this with a hotkey in Niri, add the following to ~/.config/niri/cfg/keybinds.kdl:"
echo ""
echo '    Mod+Shift+T { spawn "lens-translate"; }'
echo ""
echo "Or for OCR only:"
echo '    Mod+Shift+O { spawn "lens-translate" "-o"; }'
