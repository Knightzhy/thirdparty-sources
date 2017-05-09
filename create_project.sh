#! /bin/bash

if [ $# -ne 1 ]; then
    echo "${0} [project name]"
    exit 1
fi

mkdir ${1}
echo ${1}
sed "s/PROJECT/${1}/" Makefile.template > ${1}/Makefile
