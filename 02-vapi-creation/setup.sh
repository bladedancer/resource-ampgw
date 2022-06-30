#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

echo ================================
echo === Create Virtual API 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/musicalinstruments-vapi.yaml

sleep 20

echo ================================
echo === Release Virtual API 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/releasetag.yaml

sleep 10

axway --env $PLATFORM_ENV central get virtualapi,virtualapirelease musicalinstruments