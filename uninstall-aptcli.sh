#!/bin/env sh

#HEIGHT AND WIDTH
HEIGHT=0
WIDTH=0

#GLOBAL
REL="0.2-beta"
BACKTITLE="APT-CLI by SUFandom (Dialog Version) $REL"
TITLE="UNINSTALL"

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

exec 3>&1
input=$( dialog \
         --backtitle "$BACKTITLE" \
         --title "$TITLE" \
         --inputbox "TYPE WHAT YOU WANT TO REMOVE, IT IS CASE SENSITIVE" \
         $HEIGHT $WIDTH 2>&1 1>&3 \
  )
  
exitstatus=$?
exec 3>&- 

case $exitstatus in
     $DIALOG_OK)
             { apt-get remove $input ; } | dialog --backtitle "$BACKTITLE" --title "$TITLE" --programbox 30 60 ;
             command ./apt-options.sh 
             ;;
     $DIALOG_CANCEL)
             dialog --infobox "Aborted : $exitstatus"
             ;;
esac