#
# Copyright (c)      2019 Triad National Security, LLC
#                         All rights reserved.
#
# This file is part of the libquo project. See the LICENSE file at the
# top-level directory of this distribution.
#

get_app() {
    t=$*

    echo $t | cut -f 1 -d ':'
}

get_numpe() {
    t=$*

    echo $t | cut -f 2 -d ':'
}

run() {
    tests=("$@")

    for test in "${tests[@]}"; do
        app=$(get_app $test)
        for numpe in $(get_numpe $test); do
            echo $QUO_TESTS_PRUN $QUO_TESTS_PRUN_N $numpe $QUO_TESTS_PRUN_OTHER_ARGS $app
                 $QUO_TESTS_PRUN $QUO_TESTS_PRUN_N $numpe $QUO_TESTS_PRUN_OTHER_ARGS $app
        done
    done
}
