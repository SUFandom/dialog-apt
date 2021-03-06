#!/bin/env bash
REL="1.0.1 (Kronos)"
BUILD="2"
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
entrance="autorem.sh"
date_time=$(date +%F_%H-%M-%S)
time=$SECONDS

echo "User named : $human,  used the $entrance at $date_time . And the Seconds he or she is into the script is $time." >> .tempfile/.log
exec 3>&1
dialog --backtitle "$BT" --title "$TITLE" --yes-label "Remove ALL" --no-label "Don't" --yesno "Do you wish to remove useless pkg assets on your Termux? Suggest doing this after you're done Removing Certain Package and apt-get tells you to prompt autoremove." $HEIGHT $WIDTH 
exitnumber=$?
exec 3>&-
case $exitnumber in
$DIALOG_OK)
dialog --backtitle "$BT" --title "$TITLE" --infobox "Loading" $HEIGHT $WIDTH
sleep 2
apt-get autoremove -y  | dialog --backtitle "$BT" --title "$TITLE" --programbox 30 50
command ./corelib.sh
;;
$DIALOG_CANCEL)
command ./corelib.sh
;;
$DIALOG_HELP)
command ./help.sh
;;
esac
