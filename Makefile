# Other config
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

DIR_OUT=$(CURDIR)/out
BINARY=$(DIR_OUT)/concourse-tutorial

GO_LINKER_FLAGS=-ldflags="-s -w"
GO_PROJECT_FILES=`go list -f '{{.Dir}}' ./... | grep -v /vendor/ | sed -n '1!p'`

.PHONY: all clean deps build

all: clean deps build

deps:
	@echo "$(OK_COLOR)==> Installing glide with dependencies$(NO_COLOR)"
	@go get -u github.com/Masterminds/glide
	@glide install

	@echo "$(OK_COLOR)==> Installing testing libraries"
	@go get github.com/onsi/ginkgo/ginkgo  # installs the ginkgo CLI
	@go get github.com/onsi/gomega # fetches the matcher library

# Builds the project
build:
	@echo "$(OK_COLOR)==> Building project$(NO_COLOR)"
	@go build -o ${BINARY} ${GO_LINKER_FLAGS} ${SRC_AUTH}

# Builds the project
build:
	@echo "$(OK_COLOR)==> Building project$(NO_COLOR)"
	@go build -o ${BINARY} ${GO_LINKER_FLAGS} ${SRC_AUTH}

# Format the source code
fmt:
	@gofmt -s=true -w $(GO_PROJECT_FILES)

# Tests the project
fmt:
	@ginkgo -r

# Cleans our project: deletes binaries
clean:
	@echo "$(OK_COLOR)==> Cleaning project$(NO_COLOR)"
	if [ -d ${DIR_OUT} ] ; then rm -f ${DIR_OUT}/* ; fi
