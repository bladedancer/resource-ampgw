#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

axway central delete environment ${ENVIRONMENT} -y

sleep 10

kubectl delete namespace ${AMGPW_NAMESPACE}

axway --env $PLATFORM_ENV service-account remove $ENVIRONMENT