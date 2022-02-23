#!/data/data/com.termux/files/usr/bin/bash

#HEIGHT AND WIDTH
HEIGHT=0
WIDTH=0

#GLOBAL
REL="0.5-beta (Luz)"
BACKTITLE="APT-CLI by SUFandom (Dialog Version) $REL"
TITLE="CLEARING"

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

exec 3>&1
dialog --backtitle "$BACKTITLE" --title "ARE YOU SURE?" --yes-label "I'm aware with the Risks, so Do it.." --no-label "Go Back, I have second Thought"  --yesno "Do you want to remove unused Packages. Warning: They may be needed for future package installation, it will save your bandwith data too. But if you just really want to remove it for saving storage, then Proceed." $HEIGHT $WIDTH
exitstatus=$?
exec 3>&-
case $exitstatus in 
     $DIALOG_OK)
        { apt-get autoremove ; } | dialog --backtitle "$BACKTITLE" --title "$TITLE" --programbox 30 50 ;
        command ./apt-menu.sh 
        ;;
     $DIALOG_CANCEL)
        dialog --backtitle "$BACKTITLE" --infobox "Aborted $exitstatus" $HEIGHT $WIDTH ;
        command ./apt-menu.sh 
        ;;
esac
