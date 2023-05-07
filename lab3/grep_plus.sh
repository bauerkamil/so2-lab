#!/bin/bash -eu

## stderr to errors.log, find lines ending with '.conf', output to stdout and find_results.log
./files/fakaping.sh 2> errors.log | grep "\.conf$" | tee find_results.log

## stdout to nothing and sort stderr
./files/fakaping.sh 2>&1 1>/dev/null | sort

## write all unique lines to file all.log and stdout
./files/fakaping.sh 2>&1 | sort -u | tee all.log
