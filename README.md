# TrueNAS Core Jails Backup Script

This repository contains a shell script designed to automate the backup process for jails in TrueNAS Core. The script utilizes the `iocage` commands to export jails, create date-stamped backup files, manage these backups within a designated dataset, and perform cleanup by purging older backups.

## Usage

### Prerequisites

1. **Designate Backup Storage Location**: Create a dataset on your storage pool specifically for jail backups. For instance:
    ```
    Pool:       tank
    Dataset Name:       Jailbackups
    Dataset Location:   /mnt/tank/Jailbackups
    ```
    (Ensure modifications in the script to match your storage locations)

2. **Create Backup Folders**: Inside your designated dataset, create subfolders for each jail you intend to back up. For example:
    ```
    Pool:       tank
    Jail name:      MyJail
    Backup Folder:      /mnt/tank/Jailbackups/MyJail
    ```
    To create the folder, use the `mkdir` command, e.g., `mkdir /mnt/tank/Jailbackups/MyJail`.

3. **Set Log File Location**: Designate a location for your log files. If the folder doesn't exist, create it using `mkdir`. Update the `LOG_PATH` variable in the script to match your log file location. For instance:
    ```
    LOG_PATH="/mnt/tank/logs/Jail.log"
    ```

### Instructions

1. Clone this repository or download the `backup_jails.sh` script.

2. Modify the script:
    - Update the `LOG_PATH` variable to match your log file location.
    - Follow the "JAIL BACKUP SNIPPET" provided in the script to back up your jails. Modify it as needed for each jail you intend to back up.

3. Execute the script: `./backup_jails.sh`

### Script Details

The script performs the following actions for each jail:
- Stops the specified jail.
- Exports the jail using `iocage`.
- Starts the jail back up.
- Deletes old backups older than a specified duration (`+7d` in the example) from the designated backup folder.
- Moves the current backup to the storage folders.

Note: Modify the `find` commands with `-mtime` to adjust the duration for retaining backups according to your preference (e.g., change `+7d` to your desired duration).

## Contribution

Contributions, issues, and feature requests are welcome! Feel free to submit a pull request or open an issue.

## License

This project is licensed under the [MIT License](LICENSE).
