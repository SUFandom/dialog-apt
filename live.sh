#!/bin/sh

REL="1.0.2 (Kronos)"
BT="Dialog APT LIVE SCRIPT - $REL"
TITLE="DIALOG-APT LIVE SCRIPT"

MISSING_FILE_INS="mis-wiz=1"
MISSING_FILE_LIVE="mis-lve=1"

NO_PERMS_INS="perm-ins-x"
NO_PERMS_LIVE="perm-lve-x"

DIALOGRC=live.dialogrc

: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

HEIGHT=0
WIDTH=0

exec 3>&1
dialog --backtitle "$BT" --title "$TITLE" --yes-label "Run Live Env" --no-label "Go back" --yesno "You are entering Live Script Partition, a safer way to use the script. You can just run install on the main.sh, but it has some risks . Undeniable risks. Proceed or Not?\n" $HEIGHT $WIDTH
exit_value=$?
exec 3>&-
case $exit_value in
$DIALOG_OK)
command ./live/libs-termux-arm/launcher.sh
;;
$DIALOG_CANCEL)
command ./main.sh
;;
esac
