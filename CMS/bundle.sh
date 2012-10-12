#!/bin/bash

usage() {
    echo -e "\nbundle.sh FILE..."
    echo "Bundle (and minify) all JavaScripts in the current directory into a single file."
}

BUNDLEFILE=$1

if [ ! -n "$BUNDLEFILE" ]; then # Tests to see whether a bundlefile has been specified
    usage
    exit 0
fi

# Find YUI Compressor
if ! [ `find ~/. -type f -name yuicompressor\*.jar` ]
then
    echo "Unable to locate the YUI Compressor jar file!"
    exit 1
else 
    YUICOMPRESSOR=`find ~/. -type f -name yuicompressor\*.jar`
fi


# Minify JavaScripts

# If the output file already exists, we don't want to double its size. Remove it.
if [ -e "./$BUNDLEFILE" ]; then
    echo -e "Removing existing copy of $BUNDLEFILE."
    rm $BUNDLEFILE
fi

# Fetch external dependencies, like jQuery
echo -e "\nFetching a copy of jQuery v1.4.2..."
wget -O $BUNDLEFILE --progress=dot http://code.jquery.com/jquery-1.4.2.min.js

echo -e "\nMinifying JavaScripts..."
jslist=`find . -type f -name \*.js`

for jsfile in $jslist
do
    if [ ./$BUNDLEFILE != ${jsfile} ]
    then
        echo "Processing: ${jsfile}"
        java -jar ${YUICOMPRESSOR} ${jsfile} >> $BUNDLEFILE
    fi  
done

echo -e "\nDone."
exit 0
