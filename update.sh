#!/bin/bash

#
# This script retrieves aliases and mailing lists stored
# in the database and imports them into exim

# Variable Definitions
        API_KEY=
       API_HOST=

   ALIASES_FILE=
LISTS_DIRECTORY=

# API Requests
if [ ! -d $LISTS_DIRECTORY ]; then
    mkdir $LISTS_DIRECTORY
fi

curl --output $ALIASES_FILE --silent $API_HOST/api/mail/aliases/?key=$API_KEY
curl --silent $API_HOST/api/mail/listsArchive/?key=$API_KEY | tar -x -C $LISTS_DIRECTORY
