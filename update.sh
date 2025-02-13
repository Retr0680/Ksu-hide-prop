#!/system/bin/sh

# Define the GitHub repository details
REPO_OWNER="Retr0680"
REPO_NAME="Ksu-hide-prop"
MODULE_ZIP="ksu-hide-prop.zip"
UPDATE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/latest/download/$MODULE_ZIP"

# Define temporary download directory
TMP_DIR="/sdcard/Download/KernelSU_Update"
mkdir -p $TMP_DIR
UPDATE_ZIP="$TMP_DIR/$MODULE_ZIP"

# Check for updates manually via Kernelsu or other methods
echo "[*] Checking for updates..."

# Download the latest module ZIP from GitHub
curl -L -o "$UPDATE_ZIP" "$UPDATE_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "[✔] Download successful!"
    
    # You can automatically install the update by extracting the new module
    # Uncomment the following line if you want to update the module automatically
    # unzip -o "$UPDATE_ZIP" -d "$MODPATH"

    echo "[*] Update available! Please reboot your device to complete the update."
else
    echo "[!] Download failed."
    exit 1
fi