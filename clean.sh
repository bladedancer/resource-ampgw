#!/bin/bash

. ./env.sh

# Manually clear finalizers on any Subscriptions/AssetRequests/AccessRequests/Applications/ManagedApplications
axway --env $PLATFORM_ENV central get subscriptions -o json | jq -r .[].name | xargs -L1 -I'{}' axway central delete subscriptions -y {}

./06-marketplace/clean.sh
./05-product/clean.sh
./04-asset/clean.sh
./03-vapi-deployment/clean.sh
./02-vapi-creation/clean.sh
./01-ampgw-install/clean.sh