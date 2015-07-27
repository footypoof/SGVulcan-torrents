# SGVulcan-torrents

imple script to add multiple trackers to a torrent downloading in transmission

Sometime you might want to download some old or obscure distro that was once packaged as a torrent. But many times the tracker embeded in the torrent file has long been abandoned or it has no peers. But many other trackers might have cached your torrent and maybe those have seeds. So I wrote a quick and dirty script to get a list of online trackers from trackon.org and add them to a torrent you have downloading inside transmission.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
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
You simply run it passing as parameter the ID of the torrent you want updated. You can find the ID by running
transmission-remote -l
or maybe
transmission-remote -l | grep -i "name"
