#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

echo ================================
echo === Create Asset 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/stage.yaml

echo ================================
echo === Create Asset 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/asset.yaml

echo ================================
echo === Create Asset Mapping
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/assetmapping.yaml

echo ================================
echo === Release Asset
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/releasetag.yaml

sleep 10