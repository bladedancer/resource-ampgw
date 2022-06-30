#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

deprecated=$(mktemp)
axway --env $PLATFORM_ENV central get asset musical -o json | jq 'del(.references)|.state="deprecated"' > $deprecated.json
axway --env $PLATFORM_ENV central apply -f ${deprecated}.json

archived=$(mktemp)
jq 'del(.references)|.state="archived"' ${deprecated}.json > $archived.json
axway --env $PLATFORM_ENV central apply -f ${archived}.json

axway --env $PLATFORM_ENV central delete asset musical -y