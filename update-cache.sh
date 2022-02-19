#!/data/data/com.termux/files/usr/bin/env sh

#Global Params
BKT="APT-CLI by SUFandom (Dialog Version) $REL"
REL="0.3-beta (Zimwalt)"
TITLE="Cache Update"

#Global Dialog Size
HEIGHT=0
WIDTH=0


#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

exec 3>&1 
dialog --backtitle "$BKT" --title "$TITLE" --yes-label "Update and Upgrade all" --no-label "Back" --yesno "Update APT lists in your Termux?" $HEIGHT $WIDTH 2>&1 1>&3
exit_status=$?
exec 3>&-

case $exit_status in
      $DIALOG_OK)
             echo "Sleeping dialog.." ;
             sleep 3 ;
             apt-get update && apt-get upgrade -y ;
             dialog --backtitle "$BKT" --title "$TITLE" --infobox  "Update Complete" $HEIGHT $WIDTH ;
             sleep 5 ;
             command ./apt-options.sh
             ;;
      $DIALOG_CANCEL)
             dialog --backtitle "$BKT" --infobox "Aborting" $HEIGHT $WIDTH ;
             sleep 10 ;
             command ./apt-options.sh
             ;;
esac