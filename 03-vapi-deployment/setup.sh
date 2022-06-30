#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

echo ================================
echo === Create Extenrnal Secret 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/externalsecret.yaml


echo ================================
echo === Create Virtual Host 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/virtualhost.yaml

echo ================================
echo === Create Deployment 
echo ================================
axway --env $PLATFORM_ENV central apply -f $SOURCE_DIR/deployment.yaml

