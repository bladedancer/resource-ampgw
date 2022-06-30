#!/bin/bash

SOURCE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. $SOURCE_DIR/../env.sh

$SOURCE_DIR/setup-cluster.sh
$SOURCE_DIR/setup-ampgw.sh
