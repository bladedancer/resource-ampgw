#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

axway central delete environment ${ENVIRONMENT} -y

sleep 10

kubectl delete namespace ${AMGPW_NAMESPACE}

axway --env $PLATFORM_ENV service-account remove $ENVIRONMENT

axway --env $PLATFORM_ENV central delete watchtopic dxdemo-governanceagents -y
axway --env $PLATFORM_ENV central delete watchtopic dxdemo-traceabilityagents -y

axway --env $PLATFORM_ENV central get authprofile -o json | jq -r .[].name | xargs -L1 -I'{}' axway central delete authprofile -y {}
