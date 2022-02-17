#!/data/data/com.termux/files/usr/bin/bash

#GLOBAL PARAMS
BKT="APT-CLI By SUFandom (Dialog Version) $REL"
REL="0.2-beta"
TITLE="MASTER MODE"
WARNING="THIS AREA IS PROHIBITED TO BE USED BY INEXPERIENCE. GO AS YOU RISK"
BKT_N="WARNING"



#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}


#Dialog Height and Width
HEIGHT=0
WIDTH=0

#Main inpt
exec 3>&1
dialog  --backtitle "$BKT_N" --title "$TITLE"  --yes-label "I AGREE WITH THE RISK" --no-label "I will back out" --yesno "$WARNING, REMINDER THAT ALL PROGRAMS INCLUDING THIS SCRIPT HAS NO WARRANTY. PROCEED INSTEAD ON HELP FOR THE INSTRUCTIONS." $HEIGHT $WIDTH 
#Exit Sniffers
exit_status=$?
exec 3>&-

case $exit_status in 
         $DIALOG_OK)
           command ./master-input.sh 
           ;;
           $DIALOG_CANCEL)
           command ./apt-menu.sh
           ;;
esac