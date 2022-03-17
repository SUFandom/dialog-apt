#!/bin/env bash

REL="1.0.1 (Kronos)"
BT="Dialog APT - $REL"
TITLE="DIALOG-APT"

MISSING_FILE_INS="mis-wiz=1"
MISSING_FILE_LIVE="mis-lve=1"

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

echo "Finding Assets"
sleep 3

if ( find live.sh )
then 
echo "$(tput setaf 2)Found Live.sh$(tput sgr0)"
else 
echo "Missing Live.sh, Error: $MISSING_FILE_LIVE"
fi
sleep 1
if ( find installer/libs-termux-arm/launcher.sh )
then
echo "$(tput setaf 2)Found installer script.$(tput sgr0)"
else
echo "Missing Installer Script, Error : $MISSING_FILE_INS"
fi
sleep 1
echo "If the script broadcast an error because some certain files are missing, Please report."
sleep 5
echo "Running Asset installs"
sleep 2
apt-get update && apt-get upgrade -y
sleep 2
clear
echo "Installing Important Asset(s)"
sleep 2
apt install openssl -y
apt install dialog -y
echo "Done"
sleep 1
clear
while true ; do
exec 3>&1
opt=$( dialog --backtitle "$BT" \
--title "$TITLE" \
--menu "Welcome, Pick your Preferred Option. If assets are missing, script will Close Unexpectedly."  20 30 4 \
"1" "Install Script" \
"2" "Run without Installing" \
"3" "About" \
2>&1 1>&3 )
exit_number=$?
exec 3>&- 

case $exit_number in
$DIALOG_CANCEL)
dialog --backtitle "$BT" --title "Abort" --infobox "Aborting" $HEIGHT $WIDTH
sleep 2
exit 1
;;
esac
case $opt in
1)
 dialog --backtitle "$BT" --title "$TITLE" --infobox "Waiting....." $HEIGHT $WIDTH ;
 sleep 2 ;
 command ./ins.sh
 ;;
2)
 dialog --backtitle "$BT" --title "$TITLE" --infobox "Starting Up..." $HEIGHT $WIDTH ;
  sleep 2 ;
  command ./live.sh
  ;;
3)
dialog --backtitle "$BT" --title "$TITLE" --textbox about.txt 30 60
;;
esac
done
