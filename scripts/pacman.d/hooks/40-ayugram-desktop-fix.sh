#!/bin/sh
mv /usr/share/applications/com.ayugram.desktop.desktop /usr/share/applications/com.ayugram.desktop
sed -i 's/DBusActivatable=true/DBusActivatable=false/' /usr/share/applications/com.ayugram.desktop

