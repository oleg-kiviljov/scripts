#!/bin/bash

set -e

THIS_DIR="$(dirname "$(realpath "$0")")"

code -n "$THIS_DIR/../src"
code .
