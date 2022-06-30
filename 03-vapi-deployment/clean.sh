#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

axway --env $PLATFORM_ENV central delete deployment musical-deployment -s dxdemo -y && sleep 10
axway --env $PLATFORM_ENV central delete virtualhost musical-host -s dxdemo -y 
axway --env $PLATFORM_ENV central delete externalsecret musical-secret -s dxdemo -y
