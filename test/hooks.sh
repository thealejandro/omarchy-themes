#!/bin/bash
# Runs both hooks against a fake Omarchy state directory. No Omarchy needed.
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
T=$(mktemp -d)
trap 'rm -rf -- "$T"' EXIT
export XDG_STATE_HOME="$T/state"
CUR="$XDG_STATE_HOME/omarchy/current/theme"
mkdir -p "$CUR"
fail() { echo "FAIL: $*" >&2; exit 1; }

# 1. A cloned theme: generated hyprland.lua without rounding + shape.toml.
printf 'local active_border_color = "rgba(0a84ffee)"\n' >"$CUR/hyprland.lua"
printf 'rounding = 16\nrounding_power = 4\n' >"$CUR/shape.toml"
bash "$ROOT/hooks/40-theme-shape" fake-theme
grep -qx 'hl.config({ decoration = { rounding = 16, rounding_power = 4 } })' "$CUR/hyprland.lua" \
  || fail "shape block not appended"

# 2. Running twice does not duplicate it.
bash "$ROOT/hooks/40-theme-shape" fake-theme
(( $(grep -c 'omarchy-theme-shape' "$CUR/hyprland.lua") == 1 )) || fail "shape block duplicated"

# 3. A theme that already sets rounding is left alone.
printf 'hl.config({ decoration = { rounding = 8 } })\n' >"$CUR/hyprland.lua"
bash "$ROOT/hooks/40-theme-shape" fake-theme
grep -q 'omarchy-theme-shape' "$CUR/hyprland.lua" && fail "touched a theme that sets rounding"

# 4. Bad values never produce Lua.
printf 'local x = 1\n' >"$CUR/hyprland.lua"
printf 'rounding = "12; os.execute()"\nrounding_power = 99\n' >"$CUR/shape.toml"
bash "$ROOT/hooks/40-theme-shape" fake-theme
grep -q 'omarchy-theme-shape' "$CUR/hyprland.lua" && fail "wrote Lua from invalid values"

# 5. Broken TOML is ignored and the hook still exits 0.
printf 'rounding = \n' >"$CUR/shape.toml"
bash "$ROOT/hooks/40-theme-shape" fake-theme || fail "shape hook returned an error"

# 6. The Tide hook exits 0 even without fish/Tide/colors.
bash "$ROOT/hooks/30-tide-colors" fake-theme || fail "tide hook returned an error"

echo "ok"
