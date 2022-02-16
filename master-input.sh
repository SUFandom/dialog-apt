#!/data/data/com.termux/files/usr/bin/env sh

#Global Params
BKT="APT-CLI by SUFandom (Dialog Version) 0.1-beta"
REL="0.1-beta"
TITLE="MASTER MODE"

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
input1=$(dialog \
             --backtitle "$BKT" \
             --title "$TITLE" \
             --inputbox "Enter First Part Command, Seek Help for Details. enter cancel to go back" $WIDTH $HEIGHT \
             2>&1 1>&3 \
             )
input2=$(dialog \
             --backtitle "$BKT" \
             --title "$TITLE" \
             --inputbox "Enter Second Part Command, Seek Help for Details. enter cancel to go back" $WIDTH $HEIGHT \
             2>&1 1>&3 \
             )
input3=$(dialog \
             --backtitle "$BKT" \
             --title "$TITLE" \
             --inputbox "Enter Third Part Command, Seek Help for Details. this field can be empty if input 1 and 2 has been filled up, or a certain command has limits. enter cancel to go back." $WIDTH $HEIGHT \
             2>&1 1>&3 \
             )
grab_exit=$?
exec 3>&-
case $grab_exit in 
     $DIALOG_OK)
     command $input1 $input2 $input3 | dialog --backtitle "$BKT" --title "$TITLE" --programbox 30 50 2>&1 1>&3 ;
        command ./master-input.sh
        ;;
     $DIALOG_CANCEL)
         command ./apt-menu.sh
         ;;
esac
       