#!/usr/bin/env bash
set -euo pipefail

# Angel — Alignment Layer for OpenClaw
# Usage: ./install.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/skills/angel"
OPENCLAW_SKILLS="${OPENCLAW_SKILLS_DIR:-$HOME/.openclaw/skills}"
DEST="$OPENCLAW_SKILLS/angel"

RED='\033[0;31m'
GREEN='\033[0;32m'
DIM='\033[2m'
RESET='\033[0m'

log()  { echo -e "${DIM}[angel]${RESET} $1"; }
ok()   { echo -e "${GREEN}  ✓${RESET} $1"; }
fail() { echo -e "${RED}  ✗ $1${RESET}"; exit 1; }

# --- Validate source ---

log "Validating Angel skill files..."

[ -f "$SKILL_SRC/SKILL.md" ] || fail "Missing: skills/angel/SKILL.md"
ok "SKILL.md"

[ -f "$SKILL_SRC/references/guardian.md" ] || fail "Missing: references/guardian.md"
ok "references/guardian.md"

[ -f "$SKILL_SRC/references/clarifier.md" ] || fail "Missing: references/clarifier.md"
ok "references/clarifier.md"

for file in "$SKILL_SRC/SKILL.md" "$SKILL_SRC/references/guardian.md" "$SKILL_SRC/references/clarifier.md"; do
  [ -s "$file" ] || fail "Empty file: $file"
done

echo ""

# --- Check OpenClaw ---

if [ ! -d "$HOME/.openclaw" ]; then
  fail "OpenClaw not found at ~/.openclaw — install OpenClaw first: https://openclaw.ai"
fi
ok "OpenClaw detected"

# --- Install ---

log "Installing Angel to $DEST ..."

mkdir -p "$OPENCLAW_SKILLS"

if [ -d "$DEST" ]; then
  log "Existing Angel installation found. Replacing..."
  rm -rf "$DEST"
fi

cp -r "$SKILL_SRC" "$DEST"
ok "Angel installed"

echo ""
log "Done."
echo ""
echo -e "  Location:  ${GREEN}$DEST${RESET}"
echo ""
echo -e "  Restart your gateway to activate:"
echo -e "  ${DIM}openclaw gateway restart${RESET}"
echo ""
echo -e "  ${DIM}STOP${RESET}         → immediate halt"
echo -e "  ${DIM}/angel off${RESET}   → disable for session"
echo -e "  ${DIM}/angel${RESET}       → check status"
echo ""
echo -e "  Remove:  ${DIM}rm -rf $DEST${RESET}"
echo ""
