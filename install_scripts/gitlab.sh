#!/bin/bash
# vim: set ft=sh:
# 
# Usage: install_scripts/gitlab.sh /path/to/gitlab/data


cd $( dirname $0 )/..

[ "$1" == "--help" ] && { sed -n -e '/^# Usage:/,/^$/ s/^# \?//p' < $0; exit; }

if [ -z "$1" ] || [ ! -d "$1" ]
then
    exec $0 --help
fi

gitlab="$1"

find $gitlab/repositories/@hashed/ -maxdepth 3 -type d -name "*.git" | while read folder
do
    repo=$( basename $folder .git )

    # skip wiki repositories
    if grep -qE '\.wiki$' <<< "$repo"
    then
        continue
    fi

    test -d $folder/custom_hooks || mkdir $folder/custom_hooks
    if [ -e $folder/custom_hooks/pre-receive ]
    then
        if ! diff -q pre-receive $folder/custom_hooks/pre-receive
        then
            echo "[UPDATE] pre-receive hook to repository '$repo'"
        else
            continue
        fi
    else
        echo "[ADD] pre-receive hook to repository '$repo'"
    fi
    cp -vf pre-receive $folder/custom_hooks/
done

