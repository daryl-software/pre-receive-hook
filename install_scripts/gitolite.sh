#!/bin/bash
# vim: set ft=sh:

cd $( dirname $0 )/..

prereceivehook="~git/.gitolite/hooks/common/pre-receive"
force=0

while [ $# -gt 0 ]
do
    case $1 in
        --force)
            force=1
            shift
            ;;
        *)
            prereceivehook=$1/.gitolite/hooks/common/pre-receive
            shift
            ;;
    esac
done

if [ -e $prereceivehook ]
then
    if [ $force -eq 0 ]
    then
        echo "WARNING: $prereceivehook already exists, use --force parameter to overwrite it."
        exit 3
    fi
fi

cp -vf pre-receive $prereceivehook

