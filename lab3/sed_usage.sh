#!/bin/bash -eu

## replace $HEADER$ to /temat
for FILE in files/groovies/*; do
  sed -i 's/\$HEADER\$/\/temat/g' "${FILE}"
done

## remove line containing "Help docs"
for FILE in files/groovies/*; do
  sed -i '/Help docs/d' "${FILE}"
done
