#!/data/data/com.termux/files/usr/bin/bash

#DIALOG HEIGHT AND WIDTH PARAMS
HEIGHT=0
WIDTH=0

#DIALOG EXIT VARS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}



#Global Vars
TITLE="APT-CLI PATCH INFO"
REL="0.1-beta"
BKT="APT-CLI by SUFandom (Dialog Version)"

dialog --backtitle "$BKT" --title "$TITLE" --textbox patch.txt 30 65

command ./apt-menu.sh