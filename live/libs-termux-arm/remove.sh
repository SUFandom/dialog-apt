#!/bin/env bash

REL="1.0.2 (Kronos)"
BUILD="3"
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
entrance="remove.sh"
date_time=$(date +%F_%H-%M-%S)
time=$SECONDS

echo "User named : $human,  used the $entrance at $date_time . And the Seconds he or she is into the script is $time." >> .tempfile/.log
exec 3>&1
var=$(dialog \
  --backtitle "$BT" \
  --title "REMOVE" \
  --inputbox "TYPE WHAT PACKAGE DO YOU WANT TO REMOVE. ITS CASE SENSITIVE" $HEIGHT $WIDTH \
  2>&1 1>&3 )
exit_value=$?
exec 3>&-
case $exit_value in
$DIALOG_OK)
apt-get remove $var -y  | dialog --backtitle "$BT" --title "Progress" --programbox 30 50
command ./corelib.sh
;;
$DIALOG_CANCEL)
command ./corelib.sh
;;
esac
