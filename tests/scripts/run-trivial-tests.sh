#!/bin/bash

# Exit when any command fails.
set -e

echo "Running Trivial Tests..."

$QUO_TESTS_PRUN $QUO_TESTS_PRUN_N 1 ./trivial
