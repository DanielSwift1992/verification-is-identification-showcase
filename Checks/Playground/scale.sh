#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
swift build --product ShowcaseTools
scale_tools="$(swift build --show-bin-path)/ShowcaseTools"
python3 Checks/Playground/scale.py "$scale_tools"
