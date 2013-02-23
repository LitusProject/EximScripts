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

curl --data key=$API_KEY --output $ALIASES_FILE --silent $API_HOST/api/mail/getAliases/
curl --data key=$API_KEY --silent http://litus/api/mail/getListsArchive/ | tar -x -C $LISTS_DIRECTORY

