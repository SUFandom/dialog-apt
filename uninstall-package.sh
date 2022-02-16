#!/data/data/com.termux/files/usr/bin/bash 

#Global Params
BKT="APT-CLI by SUFandom (Dialog Version) 0.1-beta"
REL="0.1-beta"
TITLE="Remove Packages"

#GLOBAL DIALOG Size
HEIGHT=0
WIDTH=0

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}


#Act
exec 3>&1
dialog --backtitle "$BKT" --title "$TITLE" --yes-label "<∆> REMOVE PACKAGES" --no-label "Abort" --yesno "REMOVING UNIMPORTANT ASSETS, DO YOU WISH TO PROCEED? ANY ACTIONS ARE IRREVISIBLE. (REFER TO HELP FOR MORE INFO)" $HEIGHT $WIDTH 
#Exit Sniffers
exitstatus=$?
case $exitstatus in 
      $DIALOG_OK)
                 { apt-get autoremove -y ; } | dialog --backtitle "$BKT" --title "$TITLE" --programbox 30 50 ;
                 command ./apt-options.sh
                 ;;
      $DIALOG_CANCEL) 
                 command ./apt-options.sh 
                 ;;
esac