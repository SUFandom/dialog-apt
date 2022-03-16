#!/bin/env bash

REL="1.0.0 (Kronos)"
BUILD="1"
STUS="LIVE"
BT="Dialog APT LIVE SCRIPT - $REL"
TITLE="DIALOG-APT $STUS SCRIPT INSTALLER"

MISSING_FILE_LIVE_START="mis-lve-core=NULL"
MISSING_FILE_OTHERS="mis-lve-res=NULL"

NO_PERMS_INS="perm-ins-x"
NO_PERMS_LIVE="perm-lve-x"


: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

HEIGHT=0
WIDTH=0

human=$(whoami)
entrance="update.sh"
date_time=$(date +%F_%H-%M-%S)
time=$SECONDS

echo "User named : $human,  used the $entrance at $date_time . And the Seconds he or she is into the script is $time." >> .tempfile/.log

exec 3>&1
dialog --backtitle "$BT" --title "Update Packages" --yes-label "Update & Upgrade" --no-label "No thanks." --yesno "Updating APT Cache Data and Updating Packages, Continue?" $HEIGHT $WIDTH
exit_value=$?
exec 3>&-
case $exit_value in
$DIALOG_OK)
    apt-get update | dialog --backtitle "$BT" --title "Updating.." --progressbox 30 60
    dialog --backtitle "$BT" --title "Notice" --infobox "Switching to Terminal Mode Temporarily due to some issues that may occur (Unsolvable issue, Please Contact Author for futher Explaination)" $HEIGHT $WIDTH
    sleep 5
    clear
    echo "Terminal Mode Activated"
    sleep 1
    clear
    apt-get upgrade -y
    command ./corelib.sh
;;
$DIALOG_CANCEL)
    command ./corelib.sh 
    ;;
esac
