#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ ! -d ${TARGET_DIR} ]]; then
    echo "making ${TARGET_DIR}"
    mkdir ${TARGET_DIR}
fi

RM_ITEMS=$(cat ${SOURCE_DIR}/${RM_LIST})
for RM_ITEM in ${RM_ITEMS}; do

    # set -x
    if [[ -f ${SOURCE_DIR}/${RM_ITEM} ]]; then
        echo "removing ${SOURCE_DIR}/${RM_ITEM}"
        rm -rf ${SOURCE_DIR}/${RM_ITEM}
    fi
    set +x
done


ITEMS=$(ls ${SOURCE_DIR})
for ITEM in ${ITEMS}; do
    if [[ -f ${SOURCE_DIR}/${ITEM} ]]; then
        echo "moving file ${SOURCE_DIR}/${ITEM}"
        mv ${SOURCE_DIR}/${ITEM} ${TARGET_DIR}/${ITEM}
    fi
    if [[ -d ${SOURCE_DIR}/${ITEM} ]]; then
        echo "copying directory ${SOURCE_DIR}/${ITEM}"
        cp -r ${SOURCE_DIR}/${ITEM} ${TARGET_DIR}/${ITEM}
    fi
done

#here it counts all files (in the subdirectries as well) <-- commands above get rid of files in ${SOURCE_DIR}
COUNT=$(find ${SOURCE_DIR} -type f | wc -l)

if [[ ${COUNT} -gt 0 ]]; then
    echo "jeszcze cos zostalo"
    if [[ ${COUNT} -ge 2 ]]; then
        echo "zostaly co najmniej 2 pliki"
        if [[ ${COUNT} -gt 4 ]]; then
            echo "zostalo wiecej niz 4 pliki"
        else
            echo "Po co robic cos takiego dla 2 albo 3 plikow"
        fi
    fi
else
    echo "tu byl Kononowicz"
fi

#use $(sudo apt install zip) beforehand
ZIP_NAME="${TARGET_DIR}_$(date +"%Y-%m-%d").zip"
zip -r ${ZIP_NAME} ${TARGET_DIR}