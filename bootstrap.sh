#!/usr/bin/env bash

# Set up soft links from files to their destination (in home directory)

# Note: /bin/bash is required for ~/.* expansion in loop below

case $0 in
    /*|~*)
        SCRIPT_INDIRECT="`dirname $0`"
        ;;
    *)
        PWD="`pwd`"
        SCRIPT_INDIRECT="`dirname $PWD/$0`"
        ;;
esac

BASEDIR="`(cd \"$SCRIPT_INDIRECT\"; pwd -P)`"
BASEDIR="${BASEDIR}/dots"

function linkRootDots {
    for i in $1/*; do
        if [ -d $i ]; then 
            continue
        fi
        FILEDIR=`dirname $i`
        FILE=`basename $i`
        BASEFILE=$HOME/.$FILE
        if [ -f $BASEFILE -o -h $BASEFILE ]; then
            echo "Replacing file: $BASEFILE"
            rm $BASEFILE
        else
            echo "Creating link: $BASEFILE"
        fi

        ln -s $i $BASEFILE
    done
}

function removeStaleLinks {
    # Make a pass deleting stale links, if any
    for i in ~/.*; do
        [ ! -h $i ] && continue

        # We have a link: Is it stale? If so, delete it ...
        if [ ! -f $i ]; then
            echo "Deleting stale link: $i"
            rm $i
        fi
    done
}

function callBootstraps {

    for i in $1/*; do
        if [ -f $i ]; then 
            continue
        fi

        
        bootstrap=$i/bootstrap.sh
        
        if [[ -f $bootstrap ]]; then
            bash $bootstrap
        fi        
    done
}

linkRootDots $BASEDIR
callBootstraps $BASEDIR
removeStaleLinks $1