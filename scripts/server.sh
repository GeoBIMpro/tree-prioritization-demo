#!/bin/bash

set -e

if [[ -n "${PC_DEMO_DEBUG}" ]]; then
    set -x
fi

function usage() {
    echo -n \
         "Usage:
$(basename "$0")
Starts webpack-dev-server using docker-compose.

$(basename "$0") --production
Serves 'dist' dir with SimpleHTTPServer.
"
}

if [ "${BASH_SOURCE[0]}" = "${0}" ]
then
    if [ "${1:-}" = "--help" ]
    then
        usage
    elif [ "${1:-}" = "--production" ]
    then
        pushd dist && python -m SimpleHTTPServer 8000
    else
        docker-compose -f docker-compose.yml up
    fi
fi
