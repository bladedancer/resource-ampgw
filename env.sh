#!/bin/bash

if [ "$ENV" = "staging" ]; then
 . ./env-preprod.sh
elif [ "$ENV" = "preprod" ]; then
 . ./env-preprod.sh
else
 . ./env-preprod.sh
fi