#!/system/bin/sh

# Module Directory
MODDIR="$MODPATH"
GITHUB_REPO="https://github.com/Retr0680/Ksu-hide-prop"  # Replace with your repo URL
ZIP_NAME="ksu-hide-prop.zip"  # Change if your module has a different zip name

# Temporary Download Location
TMP_DIR="/data/local/tmp/ksu_update"
mkdir -p $TMP_DIR

# Log File
LOGFILE="$TMP_DIR/update_log.txt"
echo "[*] Checking for updates..." > $LOGFILE

# Get Latest Release Zip URL from GitHub
LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/YOUR_USERNAME/YOUR_REPO/releases/latest | grep "browser_download_url" | cut -d '"' -f 4)

# Check if URL was found
if [ -z "$LATEST_RELEASE_URL" ]; then
    echo "[!] Failed to get the latest update URL!" >> $LOGFILE
    exit 1
fi

echo "[*] Found update: $LATEST_RELEASE_URL" >> $LOGFILE

# Download the latest release
echo "[*] Downloading latest module..." >> $LOGFILE
curl -L -o "$TMP_DIR/$ZIP_NAME" "$LATEST_RELEASE_URL"

# Verify the download
if [ ! -f "$TMP_DIR/$ZIP_NAME" ]; then
    echo "[!] Download failed!" >> $LOGFILE
    exit 1
fi

# Extract and Install
echo "[*] Installing update..." >> $LOGFILE
unzip -o "$TMP_DIR/$ZIP_NAME" -d "$MODDIR" >> $LOGFILE 2>&1

# Set executable permissions for scripts
chmod +x "$MODDIR/install.sh"
chmod +x "$MODDIR/boot-completed.sh"

echo "[*] Update installed successfully!" >> $LOGFILE
rm -rf $TMP_DIR  # Clean up

# Reboot Required
echo "[*] Rebooting to apply changes..." >> $LOGFILE
reboot