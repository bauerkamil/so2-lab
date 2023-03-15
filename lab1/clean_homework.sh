#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}


if [[ -d ${SOURCE_DIR} ]]; then
    rm -rf ${SOURCE_DIR}
fi

if [[ -f ${RM_LIST} ]]; then
    rm -f ${RM_LIST}
fi

if [[ -d ${TARGET_DIR} ]]; then
    rm -rf ${TARGET_DIR}
fi

rm ${TARGET_DIR}*.zip