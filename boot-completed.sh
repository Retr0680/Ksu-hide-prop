#!/system/bin/sh
su -c "su -p --setprop ro.build.tags release-keys"
su -c "su -p --setprop ro.debuggable 0"
su -c "su -p --setprop ro.secure 1"