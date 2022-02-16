#!/data/data/com.termux/files/usr/bin/env sh


#GLOBAL VARIABLES
BKTITLE="APT-CLI by SUFandom (Dialog Version) 0.1-beta"
TITLE_HEADING="APT-CLI INSTALL"
TIME=$SECONDS
TITLE_STARTUP="APT-CLI"
TITLE_HEADING_B="APT-CLI ABOUT"
REL="0.1-beta"

#Height and Width for Dialog
HEIGHT=0
WIDTH=0

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}




#Exec ln bg
#Duplicate
exec 3>&1


#Input
inputins=$(dialog \
             --backtitle "$BKTITLE" \
             --title "$TITLE_HEADING" \
             --clear \
             --inputbox "Enter what you're trying to install, it is case sensitive:" \
             $HEIGHT $WIDTH  2>&1 1>&3 \
  )

#Ans
#Error Sniffers
return_value=$?
exec 3>&-
case $return_value in 
     $DIALOG_OK)
    { apt-get install $inputins -y  ; } | dialog --backtitle "$BKTITLE" --title "$TITLE_HEADING" --programbox 30 50 2>&1 1>&3
    command ./apt-install.sh
     ;;
     $DIALOG_CANCEL)
     command ./apt-menu.sh
     ;;
     $DIALOG_HELP)
     dialog --backtitle "$BKTITLE" --infobox "Loading Help" $HEIGHT $WIDTH ;
     sleep 5
     ;;
esac
