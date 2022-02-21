#!/bin/env sh

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

#GLOBAL VARIABLES
REL="0.4-beta (Kepler)"
BKT="APT-CLI by SUFandom (Dialog Version) $REL"
TITLE="OPTIONS"

#Dialog Height and Width
HEIGHT=0
WIDTH=0

exec 3>&1

dialog --backtitle "$BKT" --title "Update and Upgrade"  --yes-label "\n Update & Upgrade \n" --no-label "Abort" --yesno "Start Fetching New APT cache and install updates?" 0 0 
exitvalue=$? 
exec 3>&-

case $exitvalue in 
     $DIALOG_OK)
         dialog --backtitle "$BKT" --title "Wait.." --infobox "Loading..." 0 0 ;
         { apt-get update ; apt-get upgrade -y ; } | dialog --backtitle "$BKT" --title "Updating" --programbox 35 45 ;
         command ./apt-menu.sh
         ;;
     $DIALOG_CANCEL)
         command ./apt-options.sh
         ;;
esac
