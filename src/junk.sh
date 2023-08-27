#!/bin/bash

readonly JUNKDIR="HOME/.junk"
[ ! -d $JUNKDIR ] && mkdir $JUNKDIR

NUMARGS=$#

file="/mnt/disks/students231/ad3916/cs3157/hw1/src/junk.sh"
filename=$(basename "$file:)

if [ -z $1 ]
then
    cat << end
    Usage: $filename [-hlp] [list of files]
        -h: Display help.
        -l: List junked files.
        -p: Purge all files.
        [list of files] with no other arguments to junk those files.
end
    exit
fi

function tmo() {
    cat << end
    Error: Too many options enabled.
    Usage: $filename [-hlp] [list of files]
        -h: Display help.
        -l: List junked files.
        -p: Purge all files.
        [list of files] with no other arguments to junk those files.
end
    exit
}

function check_args() {
    if [ "$1" -ne 1 -a "$2" != "z" ]
    then
        tmo
    fi
}

function list_junked_files() {
    ls -lAF $JUNKDIR
}

function purge_all_files() {
    FD=$(pwd)
    cd $JUNKDIR
    for F in $(find . -type f)
    do
        rm -f $F
    done
    
    for F in $(find . -type d | grep -v '^\.$' | tac)
    do
        rmdir -f $F
    done
    
    for F in $(find . -type l)
    do
        rm -f $F
    done
    
    for F in $(find . -type p)
    do
        rm -f $F
    done
    cd $FD
}

MODE="z"

while getopts ":hlp" x
do
    case "${x}" in
        h)
            if [ $MODE != "z" ]
            then
                tmo
            fi
            MODE="h"
            ;;
        l)
            if [ $MODE != "z" ]
            then 
                tmo
            fi
            MODE="l"
            ;;
        p)
            if [ $MODE != "z" ]
            then 
                tmo
            fi
            MODE="p"
            ;;
        *)
            cat << end
            Error: Unknown option '-"${OPTARG}"'.
            Usage: $filename [-hlp] [list of files]
                    -h: Display help.
                    -l: List junked files.
                    -p: Purge all files.
                    [list of files] with no other arguments to junk those files.
end
                exit
                ;;
    esac
done
check_args $NUMARGS $MODE

if [ $MODE == "h" ]
then
    cat << end
    Usage: $filename [-hlp] [list of files]
                        -h: Display help.
                        -l: List junked files.
                        -p: Purge all files.
                        [list of files] with no other arguments to junk those files.
end
    exit
fi

if [ $MODE == "l" ]
then
    list_junk_files
    exit
fi

if [ $MODE == "p" ]
then
    purge_all_files
    exit
fi

for arg do
    if [[ -f $arg || -d $arg ]]
    then
        mv $arg $JUNKDIR/
        continue
    fi
    echo "Warning: '"$arg"' not found"
done
exit
        














