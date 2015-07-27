#!/bin/bash

TRANSMISSION_REMOTE='/usr/bin/transmission-remote'

# Below is a command that will generate a tracker
# list with one tracker per line
# i.e. cat /some/path/trackers.txt for a static list

LIVE_TRACKERS_LIST_CMD='curl -s www.trackon.org/api/live'

if [ $# -ne 1 ]; then
    echo "This script expects one parameter - the tracker id"
    echo "Use $TRANSMISSION_REMOTE -l to find it"
    exit 1
fi

$LIVE_TRACKERS_LIST_CMD | while read TRACKER
do
    echo "Adding $TRACKER"
    $TRANSMISSION_REMOTE -t $1 -td $TRACKER
done