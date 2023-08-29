#!/usr/bin/env bash

PCBYTES="55AA"
XBOXBYTES="99CC"
STARTINGBYTES="0x1FE"
BYTELENGTH="0x02"


DISKLOCATION="$2"

FLAG="$1"

# Check if disk is mounted
if [ -z "$DISKLOCATION" ]; then
    echo "No disk location specified"
    exit 1
fi

#check if flag is set
if [ -z "$FLAG" ]; then
    echo "No flag specified"
    exit 1
fi

if [[ "${FLAG}" == "check" ]]; then
    sudo xxd -u -ps -s "${STARTINGBYTES}" -l "${BYTELENGTH}" "${DISKLOCATION}"
else
    if [[ "${FLAG}" == "pc" ]]; then
            echo "Are you sure you want to write to ${DISKLOCATION}? (y/n)"
            read -r -n 1 -s
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "Writing PC boot sector to ${DISKLOCATION}"
                echo "${PCBYTES}" | sudo xxd -u -ps -s "${STARTINGBYTES}" -l "${BYTELENGTH}" -r - "${DISKLOCATION}"
                echo -e "Done \a"
            else
                echo "Exiting"
                exit 1
            fi

        elif [[ "${FLAG}" == "xbox" ]]; then
            echo "Are you sure you want to write to ${DISKLOCATION}? (y/n)"
            read -r -n 1 -s
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                diskutil unmountDisk "${DISKLOCATION}" && echo "Writing Xbox boot sector to ${DISKLOCATION}"; \
                echo "${XBOXBYTES}" | sudo xxd -u -ps -s "${STARTINGBYTES}" -l "${BYTELENGTH}" -r - "${DISKLOCATION}"
                echo -e "Done \a"
            else
                echo "Exiting"
                exit 1
            fi
        else
            echo "Invalid flag"
            exit 1
        fi
fi