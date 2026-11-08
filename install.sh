#!/bin/bash
# Installs the companion hooks and, optionally, the themes.
#
#   ./install.sh                 hooks only (rounded corners + Tide prompt colors)
#   ./install.sh all             hooks + every theme
#   ./install.sh tahoe aero      hooks + the themes you name
#   ./install.sh --uninstall     removes the hooks and restores your Tide colors
#
# Themes are installed with `omarchy theme install`, one repo per theme, so
# `omarchy theme update` keeps them up to date and `omarchy theme remove` removes them.

set -euo pipefail

OWNER="thealejandro"
THEMES=(cupertino cupertino-light graphite big-sur ventura tahoe fluent fluent-light obsidiana aero aero-night)
HOOKS=(30-tide-colors 40-theme-shape)
HERE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
HOOK_DIR="$HOME/.config/omarchy/hooks/theme-set.d"

die() { echo "Error: $*" >&2; exit 1; }

command -v omarchy >/dev/null || die "this needs Omarchy (https://omarchy.org)."

if [[ ${1:-} == "--uninstall" ]]; then
  [[ -x $HOOK_DIR/30-tide-colors ]] && "$HOOK_DIR/30-tide-colors" --restore
  for hook in "${HOOKS[@]}"; do
    rm -f -- "${HOOK_DIR:?}/$hook" && echo "Removed hook: $hook"
  done
  echo "Themes stay installed; remove them with: omarchy theme remove <name>"
  exit 0
fi

for hook in "${HOOKS[@]}"; do
  [[ -f $HERE/hooks/$hook ]] || die "missing hooks/$hook; run this from a clone of the repo."
  omarchy hook install theme-set "$HERE/hooks/$hook"
done

selected=()
if [[ ${1:-} == "all" ]]; then
  selected=("${THEMES[@]}")
else
  for name in "$@"; do
    [[ " ${THEMES[*]} " == *" $name "* ]] || die "unknown theme '$name'. Available: ${THEMES[*]}"
    selected+=("$name")
  done
fi

for name in "${selected[@]}"; do
  echo "Installing theme: $name"
  omarchy theme install "https://github.com/$OWNER/omarchy-$name-theme.git"
done

if (( ${#selected[@]} == 0 )); then
  echo
  echo "Hooks installed. Add themes with: $0 all   (or: $0 ${THEMES[0]} ${THEMES[5]} ...)"
  # Re-apply the current theme so the hooks take effect right away.
  current=$(omarchy theme current 2>/dev/null || true)
  [[ -n $current ]] && omarchy theme set "$current" >/dev/null 2>&1 || true
fi
