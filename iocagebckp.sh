#!/bin/bash
#
# DESCRIPTION:
# This script is for creating backups of your jails on TrueNAS.
# Using the iocage export command, a backup file with a date
# stamp will be created in the defualt location. Upon completion
# the newly created ZIP file will be moved to a dataset designated
# for Jail Backups. The folder associated to the jail being backed
# up will be checked for older versions, and files older than X days
# will be purged. Once the backup folder is "cleaned up," the newly
# created file will be moved.
#
# PREREQUISITES:
# 1) 	Create a dataset on a storage pool that you are designating 
# 	for jail backups. For example - 
#		Pool:			tank
#		Dataset Name: 		Jailbackups
#		Dataset Location:	/mnt/tank/Jailbackups
# 	(Make sure you modify the script to match your storage locations)
# 
# 2)	In your Dataset, create a subfolder for each jail you plan to
#	backup. For example:
#	
#	Pool:		tank
#	Jail name:	MyJail
#	Backup Folder:	/mnt/tank/Jailbackups/MyJail
#			
#			(to create the folder, use the mkdir command:
#	 		e.g. - mkdir /mnt/tank/Jailbackups/MyJail )
#
# 3)	Designate your log file location. If the folder doesn't exist,
#	use the 'mkdir' command to create a log folder. For this example
#	we will be using '/mnt/tank/logs/' as our log folder. At the start
#	of the script, you need to update the LOG_PATH variable to match
#	your log file location.  
#
# JAIL BACKUP SNIPPET:
# Use the snippet below and modify as needed for the jails you plan to 
# backup. If you plan to backup more than one jail, copy and paste the 
# snippet one per jail and modify as needed!
#
#	#*****************************************
#   #***---START COPY/PASTE ON NEXT LINE---***
#	echo "$(date) Backing Up Jail - [insert jail name]" >> $LOG_PATH
#	iocage stop [insert jail name] >> $LOG_PATH
#	iocage export [insert jail name] >> $LOG_PATH
#	iocage start [insert jail name] >> $LOG_PATH
#	echo "$(date) ...Deleting old backups" >> $LOG_PATH
#	echo "$(date) Files being removed: " >> $LOG_PATH
#	find /mnt/tank/JailBackups/[insert jail name]/ -mindepth 1 -mtime +7d -depth -print >> $LOG_PATH
#	find /mnt/tank/JailBackups/[insert jail name]/ -mindepth 1 -mtime +7d -delete
#	echo "$(date) ...Moving current backup to storage folders" >> $LOG_PATH
#	mv -v /mnt/tank/iocage/images/[insert jail name]* /mnt/tank/JailBackups/[insert jail name]/ >> $LOG_PATH
#	#***---FINISH COPY/PASTE ON PREVIOUS LINE---***
#	#**********************************************
#
# NOTE: in the snippet above, change the '[insert jail name]' to match the 
# 	name of the jail you are backing up. Also, lines 8 & 9 starting with
#	'find' should be updated to match how long you plan keep your backups.
#	The example declares -mtime as +7d meaning 7 days. Update as you see fit.  

# Change the log path to match your logfile location
LOG_PATH="/mnt/tank/logs/Jail.log"

# STARTING LOGFILE OUTPUT
echo "$(date) ---***************************************---" >> $LOG_PATH
echo "$(date) ---STARTING BACKUP OF TRUENAS IOCAGE JAILS---" >> $LOG_PATH
echo "$(date) ---***************************************---" >> $LOG_PATH

# Jail backups - Use the code snippet from the "JAIL BACKUP SNIPPET" provided above. 
# The snippet should be copy/pasted and modified once per jail you intend to backup!

# JAIL 1 - <INSERT NAME>
# COPY/PASTE the CODE snippet from the instructions provided in above 

# JAIL 2 - <INSERT NAME>
# COPY/PASTE the CODE snippet from the instructions provided in above 

# INSERT AS MANY JAILS AS YOU'D LIKE TO BACKUP


# ENDING LOGFILE OUTPUT
echo "$(date) ---***************************************---" >> $LOG_PATH
echo "$(date) ---FINISHING BACKUP OF TRUENAS IOCAGE JAILS---" >> $LOG_PATH
echo "$(date) ---***************************************---" >> $LOG_PATH

