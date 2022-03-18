#!/bin/env bash
REL="1.0.2 (Kronos)"
BT="Dialog APT Wizard Installer - $REL - Beta"
TITLE="DIALOG-APT WIZARD"
BUILD="3"
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

echo "Wait for the Wizard."
sleep 2
if ( find installer/libs-termux-arm/installer.sh )
then
  echo "Run found"
else
  echo "$(tput setaf 1) Installer Core not Found : $MISSING_FILE_INS$(tput sgr0)"
echo "$(tput setaf 2)Dialog-APT wizard $REL $BUILD. $(tput sgr0)"
echo "Welcome"
sleep 5
dialog --backtitle "Dialog-APT Wizard BETA" --title "Dialog-APT Installer Wizard" --msgbox "Welcome to Installation Wizard of Dialog-APT, Here is the tool if you want to fully integrate your experience using the script.." $HEIGHT $WIDTH
exec 3>&1
dialog --backtitle "$BT" --title "$TITLE" --yes-label "Install" --no-label "Go Back" --yesno "Installing the Script in Beta phase will be risky, there will be uninstallers soon, for now this is a test. Installing this also agrees to the Conclusion that the Creator will not be Responsible for damages happening." $HEIGHT $WIDTH 
exitvalue=$?
exec 3>&-
case $exitvalue in 
$DIALOG_OK)
    command ./installer/libs-termux-arm/launcher.sh
$DIALOG_CANCEL)
    command ./main.sh 
esac
