#!/bin/bash -eu


if [[ $# -ne 1 ]]; then
    echo -e "Please provide 2 directory paths as arguments"
    exit 2
fi

FIRST_DIR=${1}

if [[ ! -d ${FIRST_DIR} ]]; then
    echo -e "Directory ${FIRST_DIR} does not exist"
    exit 1
fi

FILES=$(ls ${FIRST_DIR})
for FILE in ${FILES}; do

    EXTENSION="${FILE##*.}"

    if [[ "${EXTENSION}" == "bak" ]]; then
        chmod ugo-w ${FIRST_DIR}/${FILE}
        
        chmod ug-x ${FIRST_DIR}/${FILE}
        chmod o+x ${FIRST_DIR}/${FILE}

    elif [[ "${EXTENSION}" == "txt" ]]; then
        chmod 000 ${FIRST_DIR}/${FILE}
        chmod u+r ${FIRST_DIR}/${FILE}
        chmod g+w ${FIRST_DIR}/${FILE}
        chmod o+x ${FIRST_DIR}/${FILE}

    elif [[ "${EXTENSION}" == "exe" ]]; then
        chmod 755 ${FIRST_DIR}/${FILE}

    fi

done
