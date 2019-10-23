#!/bin/bash

#
# Copyright (c)      2019 Triad National Security, LLC
#                         All rights reserved.
#
# This file is part of the libquo project. See the LICENSE file at the
# top-level directory of this distribution.
#

# Exit when any command fails.
set -e

source scripts/run-tests-common.sh

main() {
    echo "Running Fortran Tests..."

    tests=(\
        './quofort':'1 2'
    )

    run "${tests[@]}"

    exit 0
}

main
