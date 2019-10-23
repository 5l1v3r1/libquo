#!/bin/bash

emitl() {
cat << EOF
============================================================================
EOF
}

emit_envars() {
    eval "declare -A envars="${1#*=}

    echo "# The following variables affect how tests are run."
    echo "# Exported key=value pairs will change test harness behavior."

    for key in "${!envars[@]}"; do
       echo "$key=${envars[$key]}"
    done
    echo
}

export_envars() {
    eval "declare -A envars="${1#*=}

    for key in "${!envars[@]}"; do
        # Default value
        val="${envars[$key]}"
        # See if the variable if exported (that means the user wants a different
        # value).
        exval=$(bash -c "echo $(eval echo \$${key})")
        if [ "x" != "x${exval}" ]; then
            echo "# User-defined key-value pair detected: ${key}=${exval}"
            val=${exval}
        fi
        export "$key"="$val"
    done
}

main() {
    emitl
    echo "Setting up environment for testing..."
    emitl

    declare -A envars
    envars['QUO_TESTS_PRUN']='mpirun'
    envars['QUO_TESTS_PRUN_N']='-n'

    emit_envars "$(declare -p envars)"
    export_envars "$(declare -p envars)"
}

main
