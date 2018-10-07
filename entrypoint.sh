#!/usr/bin/env bash

set -e
IFS=$'\n\t'

pip install -r tests/requirements/py3.txt
if [ -n "$EXTRA_REQUIREMENTS" ]; then
    pip install -r tests/requirements/${EXTRA_REQUIREMENTS}
fi
exec $@
