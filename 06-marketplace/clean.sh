#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

export MARKETPLACE_NAME=$(axway central get marketplace -o json | jq -r .[0].name)

axway --env $PLATFORM_ENV central delete publishedproduct musical -s $MARKETPLACE_NAME -y
