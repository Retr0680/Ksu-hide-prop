# KSU Hide Prop Module

## 🔥 KernelSU Prop Hider
**KSU Hide Prop** is a KernelSU module designed to modify system properties at boot, helping to hide root access from apps that detect it.

## ⚡ Features
- ✅ Automatically modifies system properties at boot.
- ✅ Hides KernelSU traces for better root concealment.
- ✅ Regular updates via GitHub integration.
- ✅ Lightweight and battery-friendly.

## 🚀 Installation Guide
1. **Download the Module**
   - Get the latest release from the [GitHub Repository](https://github.com/Retr0680/Ksu-hide-prop)
2. **Flash the ZIP**
   - Open KernelSU
   - Install the module
   - Reboot your device
3. **Verify Installation**
   - Run: `getprop | grep kernel.su`
   - If `persist.kernel.su` is `0`, the module is working correctly!

## 🔄 Update the Module
- The module includes an `update.sh` script that checks for new versions and updates automatically.
- To manually update:
  ```sh
  su -c sh /data/adb/modules/ksu-hide-prop/update.sh
  ```

## ⚠️ Notes
- This module is optimized for KernelSU. It will **not** work with Magisk.
- If the module fails to install, ensure all scripts use **LF (Unix) line endings**.
- For best results, use a **custom kernel** with full KernelSU support.

## 🤝 Credits
- **Developed by:** [Retr0_680](https://github.com/Retr0680)
- **KernelSU Community** for continuous improvements

## 📢 Support
If you encounter issues, feel free to open an issue on the [GitHub Repository](https://github.com/Retr0680/Ksu-hide-prop/issues) or discuss it in the KernelSU community.

Enjoy a root-free detection experience! 🚀