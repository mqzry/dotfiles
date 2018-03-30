#!/usr/bin/env bash
CURRENTDIR=`dirname $BASH_SOURCE`
GITDIR="$HOME/.git"

rm -rf $GITDIR
mkdir $GITDIR

function linkDots {
    for i in $1/*; do
        if [ -d $i ]; then 
            continue
        fi
        
        FILEDIR=`dirname $i`
        FILE=`basename $i`

        if [ "$FILE" == "bootstrap.sh" ]; then
        	continue
        fi
        
        BASEFILE=$GITDIR/$FILE

        if [ "$FILE" == "gitconfig" ]; then
        	BASEFILE=$HOME/.$FILE
        fi

        if [ -f $BASEFILE -o -h $BASEFILE ]; then
            echo "Replacing file: $BASEFILE"
            rm $BASEFILE
        else
            echo "Creating link: $BASEFILE"
        fi

        ln -s $i $BASEFILE
    done
}

linkDots $CURRENTDIR