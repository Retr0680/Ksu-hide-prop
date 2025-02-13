#!/system/bin/sh

echo "[*] Running update script..."
[ -f "$MODPATH/update.sh" ] && sh "$MODPATH/update.sh" || echo "[!] Update script not found or failed."

sleep 2

# Ensure resetprop exists
command -v resetprop >/dev/null 2>&1 || { echo "[!] resetprop not found. Exiting."; exit 1; }

# General root hiding
resetprop ro.debuggable 0
resetprop ro.secure 1
resetprop ro.build.type user
resetprop persist.kernel.su 0
resetprop ro.kernel.qemu 0
resetprop ro.adb.secure 1
resetprop ro.bootmode unknown
resetprop ro.boot.verifiedbootstate green
resetprop ro.boot.flash.locked 1
resetprop ro.boot.vbmeta.device_state locked
resetprop ro.boot.warranty_bit 0
resetprop ro.vendor.boot.warranty_bit 0

# Hide KernelSU-specific traces
resetprop persist.ksu.enabled 0
resetprop persist.kernel.su 0
resetprop persist.kernel.su.hide 1

# Extra stealth settings
resetprop sys.oem_unlock_allowed 0
resetprop ro.build.selinux 1
resetprop ro.boot.selinux enforcing

echo "[*] KernelSU stealth mode applied successfully."