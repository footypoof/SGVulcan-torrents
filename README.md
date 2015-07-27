# SGVulcan-torrents

Simple script to add multiple trackers to a torrent downloading in transmission

Sometime you might want to download some old or obscure distro that was once packaged as a torrent. But many times the tracker embeded in the torrent file has long been abandoned or it has no peers. But many other trackers might have cached your torrent and maybe those have seeds. So I wrote a quick and dirty script to get a list of online trackers from trackon.org and add them to a torrent you have downloading inside transmission.

You simply run it passing as parameter the ID of the torrent you want updated. You can find the ID by running
transmission-remote -l
or maybe
transmission-remote -l | grep -i "name"
