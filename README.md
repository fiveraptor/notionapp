
# Notion (Unofficial) for Linux

An **unofficial Notion App** for Linux, built using **Electron**. This project packages the Notion web app into a native-like experience for Linux desktop environments.

## Installation

1. **Download the `setup.sh` script**:

   [Download setup.sh](https://github.com/fiveraptor/notionapp/blob/main/setup.sh)

2. **Make the script executable**:
   After downloading, you need to give the script execution permissions.

   ```bash
   chmod +x setup.sh
   ```

3. **Run the setup script** to install the app:
   ```bash
   ./setup.sh
   ```

   This will download the latest version of the app, configure it, and install it for the current user.

4. **Start the app**:
   After installation, you can start the Notion app from your applications menu.

## Uninstallation

To remove the app from your system, run the **uninstall.sh** script:

1. **Download the `uninstall.sh` script**:

   [Download uninstall.sh](https://github.com/fiveraptor/notionapp/blob/main/uninstall.sh)

2. **Make the script executable**:
   ```bash
   chmod +x uninstall.sh
   ```

3. **Run the uninstall script**:
   ```bash
   ./uninstall.sh
   ```

   This will remove the app, its associated desktop entry, and all user-specific configurations.
