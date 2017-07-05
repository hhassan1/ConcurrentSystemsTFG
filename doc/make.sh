#!/bin/bash
FILES=$(find ./dot/ -name *.dot)
for f in $FILES
do
    DIRECTORY=$(dirname $f)
    FILENAME=$(basename $f .dot)
    IMG_DIRECTORY=${DIRECTORY/dot/img}
    DESTINATION=$IMG_DIRECTORY/$FILENAME.tex
    mkdir -p $IMG_DIRECTORY && touch $DESTINATION && dot2tex -w --autosize --figonly --prog=dot -t math -ftikz -o "$DESTINATION" -e utf8 $f
done
