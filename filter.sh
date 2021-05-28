#!/bin/sh

# Build filters
# There are ~9000 files from a checkin of a renamed node_modules folder
FILTERS="/tmp/p;"
# i18n temp files
# FILTERS=${FILTERS}" /scripts\/i18n\/.*json$/p;"
# # Slow build research json files
# FILTERS=${FILTERS}" /slow-build-research\/instrumentation\/.*json$/p;"
# Process
sed -n  "${FILTERS}" bigtosmall.txt > remove-list.src
# add in the "known big files"
cat single-files.txt >> remove-list.src