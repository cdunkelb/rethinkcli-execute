#!/bin/sh
REPLICA_ID=$(docker inspect $(docker ps -q --filter name=dtr-rethinkdb) --format {{.Name}} | cut -d '-' -f3)
echo "parsed replica id as $REPLICA_ID"
echo "Executing: $1"
echo "$1" | docker run --entrypoint=rethinkcli -i --rm --net dtr-ol -e DTR_REPLICA_ID=$REPLICA_ID -v dtr-ca-$REPLICA_ID:/ca docker/dtr-rethink:2.5.0 non-interactive
echo "Done"
