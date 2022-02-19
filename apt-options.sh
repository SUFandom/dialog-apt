#!/data/data/com.termux/files/usr/bin/bash


#GLOBAL VARIABLES
BKT="APT-CLI by SUFandom (Dialog Version) $REL"
TITLE="OPTIONS"
REL="0.3-beta (Zimwalt)"
MISSING_FILE_1="mis-187/opt-mastr=0"
MISSING_FILE_2="mis-187/opt-updt-apt=0"
MISSING_FILE_3="mis-187/opt-uninx-pk=0"



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



#Menu 
exec 3>&1
pick=$( dialog \
         --backtitle "$BKT" \
         --title "$TITLE" \
         --clear \
         --cancel-label "Back" \
         --menu "Option List: " 30 50 5  \
         "1" "MASTER MODE (DANGEROUS) " \
         "2" "UPDATE LIST CACHE" \
         "3" "REMOVE PACKAGE" \
         "4" "REMOVE USELESS PACKAGES (DO THIS AFTER REMOVING CERTAIN PACKAGE) " \
         2>&1 1>&3 )
#ERROR SNIFFERS
exit_status=$?
exec 3>&-
case $exit_status in 
     $DIALOG_CANCEL)
         clear 
         command ./apt-menu.sh
         ;;
esac
case $pick in
     1)
         clear ;
         dialog --backtitle "$BKT" --infobox "LOADING" $HEIGHT $WIDTH ;
         sleep 3 ;
         command ./master.sh ;;
     2)
         clear ;
         dialog --backtitle "$BKT" --infobox "LOADING" $HEIGHT $WIDTH ;
         sleep 3 ;
         command ./apt-upgrade.sh ;;
     3) 
         clear ;
         dialog --backtitle "$BKT" --infobox "LOADING" $HEIGHT $WIDTH ;
         sleep 3 
         command ./uninstall-package.sh  ;;
     4) 
        clear ;
        dialog --backtitle "$BKT" --infobox "LOADING" $HEIGHT $WIDTH ;
        sleep 3 ;
        command ./autorem-apt.sh
        ;;
esac


