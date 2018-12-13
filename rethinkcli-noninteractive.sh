#!/bin/sh
# Author: Carl Dunkelberger (carl.dunkelberger@docker.com)
# Updated 12/13/2018
# Tested On: UCP 3.0.7 DTR 2.5.6 Engine 17.06.2-ee-16
# This script is provided as a convenience for troubleshooting. This is not intended to be used as an integral component of the Docker EE suite.

usage () {
echo "Usage: $0 RETHINK_QUERY"
echo "Example: $0 \"r.db('dtr2').info()\"" 
}

[ -z "$1" ] && usage && exit

REPLICA_ID=$(docker inspect $(docker ps -q --filter name=dtr-rethinkdb) --format {{.Name}} | cut -d '-' -f3)
echo "parsed replica id as $REPLICA_ID"
echo "Executing: $1"
echo "$1" | docker run --entrypoint=rethinkcli -i --rm --net dtr-ol -e DTR_REPLICA_ID=$REPLICA_ID -v dtr-ca-$REPLICA_ID:/ca docker/dtr-rethink:2.5.0 non-interactive
echo
echo "Done"
