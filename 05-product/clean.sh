#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

# Deprecate, archive and delete plan
draft=$(mktemp)
axway --env $PLATFORM_ENV central get productplan freemusic -o json | jq 'del(.references)|del(.status)|.state="draft"' > $draft.json
axway --env $PLATFORM_ENV central apply -f ${draft}.json
deprecated=$(mktemp)
jq '.state="deprecated"' ${draft}.json > $deprecated.json
axway --env $PLATFORM_ENV central apply -f ${deprecated}.json
archived=$(mktemp)
jq '.state="archived"' ${deprecated}.json > $archived.json
axway --env $PLATFORM_ENV central apply -f ${archived}.json
axway --env $PLATFORM_ENV central delete productplan freemusic -y

# Delete units
axway --env $PLATFORM_ENV central delete productplanunit transactions -y

# Deprecate, archive and delete product
deprecated=$(mktemp)
axway --env $PLATFORM_ENV central get product musical -o json | jq 'del(.references)|.state="deprecated"' > $deprecated.json
axway --env $PLATFORM_ENV central apply -f ${deprecated}.json
archived=$(mktemp)
jq '.state="archived"' ${deprecated}.json > $archived.json
axway --env $PLATFORM_ENV central apply -f ${archived}.json
axway --env $PLATFORM_ENV central delete product musical -y