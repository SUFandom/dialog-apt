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
entrance="install.sh"
date_time=$(date +%F_%H-%M-%S)
time=$SECONDS

echo "User named : $human, used the $entrance at $date_time . And the Seconds he or she is into the script is $time." >> .tempfile/.log

exec 3>&1
input=$(dialog \
        --backtitle "$BT" \
        --title "$TITLE" \
        --clear \
        --yes-label "Search" \
        --no-label "Go Back" \
        --inputbox "Type what you Want to Install.. It is Case Sensitive. So double Check. " $HEIGHT $WIDTH \
        2>&1 1>&3 \ 
  )
exitstatus=$?
exec 3>&-
case $exitstatus in
$DIALOG_OK)
 { command apt-get install $input -y ; } | dialog --backtitle "$BT" --title "Result" --programbox 30 65
 command ./install.sh ;;
$DIALOG_CANCEL)
command ./corelib.sh
;;
$DIALOG_ESC)
command ./corelib.sh
;;
$DIALOG_HELP)
command ./help.sh
;;
esac
