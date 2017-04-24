#!/bin/sh

# Builds

usage(){
    echo "usage: go_build.sh (linux|windows|darwin) <VERSION> [DIR_OUT]"
    exit 1
}

export GOOS="${1}"
export VERSION="${2}"
DIR_OUT="${3}"

if ! [ "${GOOS}" = "linux" ] && ! [ "${GOOS}" = "windows" ] && ! [ "${GOOS}" = "darwin" ]; then
    echo "Platform must be linux, windows or darwin."
    usage
fi

if [ -z "${VERSION}" ]; then
    echo "Version options is required."
    usage
fi

if [ -z "${DIR_OUT}" ]; then
    DIR_OUT="$(pwd)"
fi

## Compiler options
export GOARCH=amd64
export CGO_ENABLED=0


# Fix go path
mkdir -p /go/src/github.com/
ln -sf "$(pwd)" /go/src/github.com/super-app
cd /go/src/github.com/super-app


BINARY_NAME="super_${VERSION}_${GOOS}_${GOARCH}"
BINAY_PATH="${DIR_OUT}/${BINARY_NAME}"

# Compile the application
go build  -ldflags="-X main.version=${VERSION}" -o "${BINAY_PATH}"
