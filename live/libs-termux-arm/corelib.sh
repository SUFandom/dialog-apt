#!/bin/env bash

REL="1.0.2 (Kronos)"
BUILD="3"
STUS="LIVE"
BT="Dialog APT LIVE SCRIPT - $REL"
TITLE="DIALOG-APT $STUS SCRIPT MENU"

MISSING_FILE_LIVE_START="mis-lve-core=NULL"
MISSING_FILE_OTHERS="mis-lve-res=NULL"

NO_PERMS_INS="perm-ins-x"
NO_PERMS_LIVE="perm-lve-x"

human=$(whoami)
entrance="corelib.sh"
date_time=$(date +%F_%H-%M-%S)
time=$SECONDS

echo "User named : $human, used the $entrance at $date_time . And the Seconds he or she is into the script is $time." >> .tempfile/.log

: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

HEIGHT=0
WIDTH=0


exec 3>&1
menu=$(dialog \
    --backtitle "$BT" \
    --title "$TITLE" \
    --clear \
    --yes-label "Go" \
    --no-label "Exit" \
    --menu "Dialog-apt Menu (Version:$REL, Build: $BUILD). Select the Following:" 30 50 9 \
    "1" "Install Packages" \
    "2" "Update Packages and APT" \
    "3" "Remove Packages" \
    "4" "Clean Unecessary Packages" \
    "5" "Find Packages" \
    "6" "Help and Support" \
    "7" "About" \
    "8" "Patch Lists" \
    2>&1 1>&3 \
  )
exit_value=$?
exec 3>&-
case $exit_value in
$DIALOG_CANCEL)
dialog --backtitle "$BT" --title "Exiting" --infobox "Exiting Process $exit_value." $HEIGHT $WIDTH
sleep 3
exit 1
exit 1
exit 1
;;
$DIALOG_HELP)
command ./help.sh
;;
$DIALOG_ESC)
dialog --backtitle "$BT" --title "Exiting using ESC" --infobox "Exiting using ESC Key.. Exit Code: $exit_value" $HEIGHT $WIDTH
;;
esac
case $menu in
1)
 dialog --backtitle "$BT" --title "Loading.." --infobox "Starting Installer Script" $HEIGHT $WIDTH ;
 sleep 2 ;
 command ./install.sh
;;
  2)
  dialog --backtitle "$BT" --title "Loading.." --infobox "Starting Update Script" $HEIGHT $WIDTH ;
  sleep 3 ;
  command ./update.sh
  ;;
  3)
  dialog --backtitle "$BT" --title "Loading.." --infobox "Starting Remove Packages" $HEIGHT $WIDTH ;
  sleep 2 ;
  command ./remove.sh
  ;;
  4)
  dialog --backtitle "$BT" --title "Loading.. " --infobox "Starting Autoremove script" $HEIGHT $WIDTH ;
  sleep 2 ;
  command ./autorem.sh
  ;;
  5)
  dialog --backtitle "$BT" --title "Laoding.." --infobox "Starting Find Packages Script" $HEIGHT $WIDTH ;
  sleep 2 ;
  command ./search.sh
  ;;
  6)
  dialog --backtitle "$BT" --title "Loading.." --infobox "Starting Help and Support" $HEIGHT $WIDTH ;
  sleep 2 ;
  command ./help.sh
  ;;
  7)
  dialog --backtitle "$BT" --title "About" --textbox help-and-info-assets/about.txt 30 65 ;
  command ./corelib.sh
  ;;
  8)
  dialog --backtitle "$BT" --title "Patch Lists" --textbox help-and-info-assets/patch.txt 30 65 ;
  command ./corelib.sh
;;
esac
