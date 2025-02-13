#!/system/bin/sh

# Define GitHub repository details
REPO_OWNER="Retr0680"
REPO_NAME="ksu-hide-prop"
MODULE_ZIP="ksu-hide-prop.zip"
UPDATE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/latest/download/$MODULE_ZIP"

# Define temporary download directory
TMP_DIR="/sdcard/Download/KernelSU_Update"
mkdir -p $TMP_DIR
UPDATE_ZIP="$TMP_DIR/$MODULE_ZIP"

# Check for updates
echo "[*] Checking for updates from GitHub..."

# Download the latest module ZIP from GitHub
curl -L -o "$UPDATE_ZIP" "$UPDATE_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "[✔] Download successful!"
    
    # Optionally, update the module by extracting the new version
    # Make sure $MODPATH is correctly set to where your module is installed
    unzip -o "$UPDATE_ZIP" -d "$MODPATH"

    # Reboot prompt for the user to apply the update
    echo "[*] Update applied. Please reboot your device to complete the update."

else
    echo "[!] Download failed."
    exit 1
fi