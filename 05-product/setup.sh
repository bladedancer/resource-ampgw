#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

echo ================================
echo === Create Product 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/product.yaml

echo ================================
echo === Create Plan 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/productplan.yaml

echo ================================
echo === Release Product
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/releasetag.yaml

sleep 10

echo ================================
echo === Activate the Plan 
echo ================================
active=$(mktemp)
axway --env $PLATFORM_ENV central get productplan freemusic -o json | jq 'del(.references)|del(.status)|.state="active"' > $active.json
axway --env $PLATFORM_ENV central apply -f ${active}.json
