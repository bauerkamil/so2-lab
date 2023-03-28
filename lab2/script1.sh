#!/bin/bash -eu


if [[ $# -ne 2 ]]; then
    echo -e "Please provide 2 directory paths as arguments"
    exit 2
fi

FIRST_DIR=${1}
SECOND_DIR=${2}

if [[ ! -d ${FIRST_DIR} ]]; then
    echo -e "Directory ${FIRST_DIR} does not exist"
    exit 1
fi

if [[ ! -d ${SECOND_DIR} ]]; then
    echo -e "Directory ${SECOND_DIR} does not exist"
    exit 1
fi


create_ln(){
  FILENAME=$1
  EXTENSION="${FILENAME##*.}"
  FILENAME_NO_EXT="$(echo ${FILENAME%.*} | tr '[:lower:]' '[:upper:]')"
  ln -s "${FIRST_DIR}/${FILENAME}" "${SECOND_DIR}/${FILENAME_NO_EXT}_ln.${EXTENSION}"
}

FILES=$(ls ${FIRST_DIR})
for FILE in ${FILES}; do

  if [[ -L ${FIRST_DIR}/${FILE} ]]; then
    echo "${FILE} is a symbolic link"
    create_ln ${FILE}

  elif [[ -f ${FIRST_DIR}/${FILE} ]]; then
    echo "${FILE} is a regular file"
    create_ln ${FILE}

  elif [[ -d ${FIRST_DIR}/${FILE} ]]; then
    echo "${FILE} is a directory"
  fi

done
