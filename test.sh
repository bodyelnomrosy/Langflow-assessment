#!/bin/bash

MODE=""
OUTPUT_PATH=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        base|new) MODE="$1"; shift ;;
        --output_path) OUTPUT_PATH="$2"; shift 2 ;;
        *) shift ;;
    esac
done

if [ -z "$OUTPUT_PATH" ]; then
    OUTPUT_PATH="test-results.xml"
fi

if [ "$MODE" == "base" ]; then
    pytest --junitxml="$OUTPUT_PATH" -m "not new"
elif [ "$MODE" == "new" ]; then
    pytest --junitxml="$OUTPUT_PATH"
else
    pytest --junitxml="$OUTPUT_PATH"
fi
