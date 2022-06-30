#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

export MARKETPLACE_NAME=$(axway central get marketplace -o json | jq -r .[0].name)

# inject the id as it's provisioned from platform and changes.
cat $SOURCE_DIR/publishedproduct.tpl | envsubst > $SOURCE_DIR/publishedproduct.yaml

echo ================================
echo === Publish Product
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/publishedproduct.yaml