#!/usr/bin/env bash
# Every law this package holds itself to, in one list, the same driver as the theory's.
#
#   ./check.sh --list       print the registered laws without executing them
#   ./check.sh              every law
#   ./check.sh --skip law   every law but the named one
#   ./check.sh --only law   the named law alone
#
# The theory package is the sibling checkout (or VI_THEORY_PATH). Its Tools run the
# lint, the census, the voice and the plain judge from this root; ShowcaseTools runs the
# commands that build or read the company.
set -uo pipefail
cd "$(dirname "$0")"

MODE_LIST=""
MODE_SKIP=""
MODE_ONLY=""
while [ $# -gt 0 ]; do
    case "$1" in
        --list) MODE_LIST="yes"; shift ;;
        --skip) MODE_SKIP="$2"; shift 2 ;;
        --only) MODE_ONLY="$2"; shift 2 ;;
        *) echo "check.sh: unknown argument $1" >&2; exit 2 ;;
    esac
done

export VI_THEORY_PATH="${VI_THEORY_PATH:-$(cd ../verification-is-identification 2>/dev/null && pwd)}"
if [ -z "$VI_THEORY_PATH" ] || [ ! -f "$VI_THEORY_PATH/Package.swift" ]; then
    echo "check.sh: the theory package is not at ../verification-is-identification; set VI_THEORY_PATH" >&2
    exit 2
fi

# Two laws read only a committed tree: the second judge checks out HEAD into a worktree, and
# the artifacts law regenerates files and diffs them.
NEEDS_CLEAN="judge artifacts"

# tag | what it holds | how to ask
LAWS=(
"build|the package builds and its tests pass|swift build && swift test"
"publication|the published claim holds and its seven mutations are refused by name|bash Checks/publication.sh"
"rules|a rule is one substitution|swift run Tools lint Sources/DynamicsDemo/Rules.swift --strict"
"artifacts|the committed artifacts match the types, byte for byte|swift package --allow-writing-to-package-directory generate >/dev/null && swift run OrgDemo render-doc >/dev/null && swift run DocumentKitDemo render-doc >/dev/null && swift run DocumentKitDemo claim --write >/dev/null && swift run VectorDemo all >/dev/null && git diff --exit-code"
"judge|the second judge agrees with the compiler|swift run ShowcaseTools judge diff 200"
"contract|the organization court answers its versioned suite|bash Checks/organization-contract.sh"
"readme|the numbers are counted, not remembered|swift run ShowcaseTools readme"
"census|the declaration count per target|swift run Tools census --target DocumentKit=Sources/DocumentKit --target Organization=Sources/Organization --target ShowcaseTools+Plugins=Sources/ShowcaseTools,Plugins"
"voice|lexical counts do not exceed their authored pins|swift run Tools voice --scope kit=docs:Sources/DocumentKit@18 --scope pages=markdown:Sources!Papers@304 --scope readme=file:README.md@0"
"law|the grammar carries every source file|swift run Tools grammar"
)

if [ "$MODE_LIST" = "yes" ]; then
    if [ -n "$MODE_ONLY$MODE_SKIP" ]; then
        echo "check.sh: --list cannot be combined with check selection" >&2
        exit 2
    fi
    printf '%s\n' "${LAWS[@]}"
    exit 0
fi

if [ -n "$MODE_ONLY" ]; then
    found=""
    for entry in "${LAWS[@]}"; do
        [ "${entry%%|*}" = "$MODE_ONLY" ] && found="yes"
    done
    if [ -z "$found" ]; then
        echo "check.sh: no check named $MODE_ONLY" >&2
        exit 2
    fi
fi

failed=()
skipped=()
for entry in "${LAWS[@]}"; do
    tag="${entry%%|*}"
    rest="${entry#*|}"
    said="${rest%%|*}"
    cmd="${rest#*|}"
    [ -n "$MODE_ONLY" ] && [ "$tag" != "$MODE_ONLY" ] && continue
    [ -n "$MODE_SKIP" ] && [ "$tag" = "$MODE_SKIP" ] && continue
    if [[ " $NEEDS_CLEAN " == *" $tag "* ]] && [ -n "$(git status --porcelain)" ]; then
        echo "── $tag: $said"
        echo "   not asked: this law reads a committed tree, and yours has work in it"
        skipped+=("$tag")
        continue
    fi
    echo "── $tag: $said"
    if ! eval "$cmd"; then
        failed+=("$tag")
    fi
done

if [ ${#failed[@]} -gt 0 ]; then
    echo "✗ RED: ${failed[*]}"
    exit 1
fi
if [ ${#skipped[@]} -gt 0 ]; then
    echo "◐ PARTIAL: every law asked holds, but ${skipped[*]} was not asked (it reads a committed tree, and yours has work in it)."
    echo "  This is not a green verdict. Commit the work, then run ./check.sh again."
    exit 3
fi
echo "✓ ALL LAWS HOLD"
