#!/usr/bin/env bash
# The executable must be rebuilt before judging an unchanged source checkout.
set -euo pipefail
cd "$(dirname "$0")/.."
swift build --product ShowcaseTools
organization_contract_bin="$(swift build --show-bin-path)/ShowcaseTools"
organization_contract_command=$(python3 -c 'import json,sys; print(json.dumps([sys.argv[1], "judge"]))' "$organization_contract_bin")
# Explicit selection keeps the single-suite door for external consumers.
for argument in "$@"; do
    case "$argument" in
        --manifest|--manifest=*)
            exec python3 Checks/organization-contract.py \
                --command-json "$organization_contract_command" \
                --implementation-id "local SwiftPM ShowcaseTools build" "$@" ;;
    esac
done
for release in v0.1 v0.2; do
    echo "organization contract $release"
    python3 Checks/organization-contract.py \
        --manifest "Contracts/OrganizationCourt/$release/contract.json" \
        --command-json "$organization_contract_command" \
        --implementation-id "local SwiftPM ShowcaseTools build" "$@"
done
