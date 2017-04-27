#!/bin/sh

# Horrible example of integereation test :D

# Requires an arugment ${1} the url
if [ -z "${1}" ]; then
    echo "Missing URL argument i.e. $0 http://127.0.0.1:8080"
    exit 1
else
    url="${1}"
fi

# Assume we have no errors :D
exit_code=0

## Function to check endpoints
##
check() {
    printf "Checking %-10s" "${1}"
    if curl -s "${url}${1}" | grep "${2}" > /dev/null 2>&1
    then
        printf "[OK]\n"
    else
        printf "[FAILED]\n"
        exit_code=1
    fi
}

# We simlulate slightly slow test
check "/" "HelloWorld"
check "/ping" "pong"
check "/status" "running"

# Just sleep to simulate doing something :)
SLEEP_TIME=1
echo "Sleeping for ${SLEEP_TIME}"
sleep "${SLEEP_TIME}"

exit "${exit_code}"
