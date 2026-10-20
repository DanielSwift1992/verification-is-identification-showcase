#!/usr/bin/env bash
# The same pinned theory judges the page and supplies its primitive definitions.
set -euo pipefail
cd "$(dirname "$0")/../.."
: "${VI_THEORY_PATH:?set VI_THEORY_PATH to the compiler theory checkout}"
swift build --product Tools
palette_judge="$(swift build --show-bin-path)/Tools"
python3 Checks/Playground/palette-count.py \
    --theory "$VI_THEORY_PATH" --judge "$palette_judge" "$@"
