#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
UPDATE_URL="https://github.com/Retr0680/ksu-hide-prop/archive/refs/heads/main.zip"
UPDATE_ZIP="/data/local/tmp/ksu-hide-prop-update.zip"
EXTRACT_PATH="/data/local/tmp/ksu-hide-prop-update"
BACKUP_PATH="/data/local/tmp/ksu-hide-prop-backup"

# Notify user
echo "[*] Checking for updates..."

# Backup current module
rm -rf "$BACKUP_PATH"
cp -r "$MODPATH" "$BACKUP_PATH"
chmod -R 755 "$BACKUP_PATH"

# Download latest module version
curl -L "$UPDATE_URL" -o "$UPDATE_ZIP"
if [ $? -ne 0 ]; then
    echo "[!] Failed to download update. Restoring backup..."
    rm -rf "$MODPATH"
    cp -r "$BACKUP_PATH" "$MODPATH"
    exit 1
fi

# Remove old extracted files
rm -rf "$EXTRACT_PATH"
mkdir -p "$EXTRACT_PATH"

# Extract new update
unzip -o "$UPDATE_ZIP" -d "$EXTRACT_PATH" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[!] Failed to extract update. Restoring backup..."
    rm -rf "$MODPATH"
    cp -r "$BACKUP_PATH" "$MODPATH"
    exit 1
fi

# Copy new files to module directory
cp -rf "$EXTRACT_PATH"/* "$MODPATH"/
chmod -R 755 "$MODPATH"

# Ensure scripts have execute permissions
chmod +x "$MODPATH/install.sh"
chmod +x "$MODPATH/boot-completed.sh"
chmod +x "$MODPATH/update.sh"

# Cleanup
rm -rf "$UPDATE_ZIP" "$EXTRACT_PATH"

echo "[✔] Update applied successfully! Reboot to take effect."
exit 0