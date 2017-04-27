#!/bin/sh
# fail if any step fails
set -e
set -x

# Just get path relative to this script and go to root
MY_PATH="$(dirname "${0}")"     # relative
DIR="$(cd "$MY_PATH" && pwd )"  # absolutized and normalized
cd "${DIR}/../"

# If no go path set it to /go
if ! [ -z "${GOPATH}" ]; then
    echo "Setting GOPATH='/go'"
    export GOPATH="/go"
fi

# Fix go path
mkdir -p /go/src/github.com/
ln -sf "$(pwd)" /go/src/github.com/super-app
cd /go/src/github.com/super-app

## Run go tests
go test -v

# Just sleep to simulate doing something :)
SLEEP_TIME=1
echo "Sleeping for ${SLEEP_TIME}"
sleep "${SLEEP_TIME}"
