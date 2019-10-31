#!/bin/bash

if test $# -ne 1; then
	echo "USAGE: $(basename $0) <interface>"
	exit 2
fi

IFACE=$1
IFACE_EXIST=0
for net in $(ls /sys/class/net/); do
	if [ "$IFACE" = "$net" ]; then
		IFACE_EXIST=1
	fi
done
if test $IFACE_EXIST -ne 1; then
	echo "$IFACE does not exist"
	exit 2
fi

cp tcgui-start /bin/tcgui-start
echo "export TCGUI_REPO_PATH=$(realpath $(dirname $0)/..)" > /bin/tcgui-env
echo "export TCGUI_INTERFACE=$IFACE" >> /bin/tcgui-env
chmod +x /bin/tcgui-env
cp tcgui.service /lib/systemd/system/
systemctl enable tcgui
