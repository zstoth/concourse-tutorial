#!/bin/sh

# If no go path set it to /go
if ! [ -z "${GOPATH}" ]; then
    echo "Setting GOPATH='/go'"
    export GOPATH="/go"
    mkdir -p "/go"
fi

go get -u github.com/Masterminds/glide
glide install

go get -u github.com/onsi/ginkgo/ginkgo
go get -u github.com/onsi/gomega
