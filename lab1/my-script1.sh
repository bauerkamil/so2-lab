#!/bin/bash

#chmod +x ./skrypt.sh
# echo "Hey"

#pobranie argumentów ${numer_arg:-domyslna_wart}
DIRECTORY=${1:-katalog}
FILE=${2}

if [[ -d ${DIRECTORY} ]]; then
    echo "usuwam ${DIRECTORY}, istnieje"
    rm -rf ${DIRECTORY}
fi
mkdir ${DIRECTORY}

ITEMS=$(cat ${FILE})
echo "${ITEMS}"

COUNTER=0

#wypisz linie przed wykonaniem
set -x
for ITEM in ${ITEMS}; do

    if [[ $((COUNTER % 2)) -eq 0 ]]; then
    #if test _equation_ -eq 0 ; --> 
    #$(( działanie matematyczne

        echo "Creating ${ITEM} as file"
        touch ${DIRECTORY}/${ITEM}
    else
        echo "Creating ${ITEM} as dir"
        mkdir ${DIRECTORY}/${ITEM}

    fi

    COUNTER=$((COUNTER+1))
done

#move A B --> przenieś 
#cp A B --> skopiuj
#date -flag
#explainshell.com 