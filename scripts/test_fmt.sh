#!/bin/sh
set -e
echo "" | gofmt
set +e

# Just get path relative to this script and go to root
MY_PATH="$(dirname "${0}")"     # relative
DIR="$(cd "$MY_PATH" && pwd )"  # absolutized and normalized
cd "${DIR}/../"

echo "Running lint on all the following files"
ls ./*.go
echo ""

# Run fmt
fmt_out="$(gofmt -l ./*.go)"
fmt_lines="$(gofmt -l ./*.go | wc -l)"
if [ "${fmt_lines}" -ne "0" ]; then
    echo "fmt error detected"
    echo "__________________"
    echo "The following files are not formeted correctly"
    echo ""
    echo "${fmt_out}"
    exit_code=1
else
    echo "fmt ok"
    exit_code=0
fi

# Just sleep to simulate doing something :)
SLEEP_TIME=1
echo "Sleeping for ${SLEEP_TIME}"
sleep "${SLEEP_TIME}"

exit "${exit_code}"
