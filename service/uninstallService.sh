#!/bin/bash

systemctl disable tcgui
rm /bin/tcgui-env
rm /bin/tcgui-start
rm /lib/systemd/system/tcgui.service
