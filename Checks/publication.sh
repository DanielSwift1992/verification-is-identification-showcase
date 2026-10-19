#!/usr/bin/env bash
# The publication verdicts, moved with DocumentKit (T-0015): the published claim of
# DocumentKitDemo/Claim.swift and its seven refusals in Checks/Publication.swift.
#
# The protocol is the theory's Checks/verdict.sh, for these seven flags: the fixture first
# typechecks without a mutation, then each flag must make the compiler refuse with exit 1 and
# name its rejected type. A crash, an exhausted solver or a missing module is not a refusal.
set -uo pipefail
cd "$(dirname "$0")/.."

publication_tmp="$(mktemp -d)"
trap 'rm -rf "$publication_tmp"' EXIT

swift build --product DocumentKitDemo || exit 1
publication_bin="$(swift build --show-bin-path)"

typecheck() {
    swiftc -typecheck -I "$publication_bin/Modules" \
        -module-cache-path "$publication_tmp/cache" \
        Sources/DocumentKitDemo/Claim.swift Checks/Publication.swift "$@"
}

if ! typecheck >"$publication_tmp/positive.log" 2>&1; then
    cat "$publication_tmp/positive.log"
    echo "publication: ERROR — the positive fixture failed"
    exit 1
fi
echo "publication: positive Claim.swift + Publication.swift holds"

for publication_case in \
    PUBLICATION_ARCHIVE_IS_ACTIVE:RejectedPublicationArchive \
    PUBLICATION_OTHER_QUESTION:RejectedPublicationQuestion \
    PUBLICATION_OTHER_ENCODING:RejectedPublicationEncoding \
    PUBLICATION_OTHER_SPACE:RejectedPublicationSpace \
    PUBLICATION_SAME_LABEL_DIFFERENT_READING:RejectedPublicationReadingBridge \
    PUBLICATION_COHERENT_FALSE_READINGS:RejectedCoherentPublication \
    PUBLICATION_VISIBLE_IDENTIFIES_SOURCE:RejectedPublishedIdentification
do
    publication_flag="${publication_case%%:*}"
    publication_name="${publication_case#*:}"
    if [ "$(grep -cE "^#if ${publication_flag}$" Checks/Publication.swift)" -ne 1 ]; then
        echo "publication: ERROR — expected one fixture for $publication_flag"
        exit 1
    fi
    publication_log="$publication_tmp/$publication_flag.log"
    if typecheck "-D$publication_flag" >"$publication_log" 2>&1; then
        echo "publication: ERROR — $publication_flag was accepted"
        exit 1
    else
        publication_status=$?
    fi
    if [ "$publication_status" -ne 1 ] || grep -Eq \
        'Stack dump:|[Pp][Ll][Ee][Aa][Ss][Ee] submit a bug report|Assertion failed|cannot build rewrite system|rule (length|count) limit exceeded|reasonable time' \
        "$publication_log"; then
        cat "$publication_log"
        echo "publication: ERROR — compiler could not check $publication_flag (exit $publication_status)"
        exit 1
    fi
    if grep -Eq 'error: (cannot find .* in scope|no such module )' "$publication_log"; then
        cat "$publication_log"
        echo "publication: ERROR — missing dependency while checking $publication_flag"
        exit 1
    fi
    if ! grep -q 'error:' "$publication_log" || ! grep -q "$publication_name" "$publication_log"; then
        cat "$publication_log"
        echo "publication: ERROR — failure did not name $publication_name"
        exit 1
    fi
    echo "publication: refused $publication_flag"
done
echo "✓ THE PUBLICATION holds: one positive claim, seven named refusals"
