#! /usr/bin/env sh

set -euC

curl -X 'POST' \
  'http://'"$GCROSTORE_HOST"'/v0/cancel/all' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "user": {
        "name": "'"$USER_NAME"'",
        "email": "'"$USER_EMAIL"'"
    },
    "selenium": {
        "url": "'"http://$SELENIUM_HOST.$POD_NAMESPACE.svc.cluster.local:4444/wd/hub"'",
        "desired_capabilities": '"$SELENIUM_DESIRED_CAPABILITIES"'
    },
    "google": {
        "creds": '"$GOOGLE_CREDENTIALS"',
        "sheet_id": "'"$GOOGLE_SHEET_ID"'"
    }
}'
