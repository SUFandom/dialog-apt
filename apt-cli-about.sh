#!/data/data/com.termux/files/usr/bin/env sh

#GLOBAL VARIABLE
TITLE="APT-CLI ABOUT PAGE"
REL="0.1-beta"
BKT="APT-CLI by SUFandom (Dialog Version)"



#Error Variable 
MISSING_FILE="mis-187/inf=0"

#Global Dialog Height and Width
HEIGHT=0
WIDTH=0

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

if ( test -e about.txt )
then 
     dialog --backtitle "$BKT" --title "$TITLE" --infobox "Loading Help Page" $HEIGHT $WIDTH
     sleep 10
else
     dialog --backtitle "$BKT" --title "ERROR" --infobox "About File Missing, Screenshot the Error to Report on Github: ERROR: $MISSING_FILE" $HEIGHT $WIDTH
     sleep 10
     command ./apt-menu.sh
fi
exec 3>&1
dialog --backtitle "$BKT" --title "ABOUT" --textbox about.txt 35 60
#Exit Grabbers
return_value=$?
exec 3>&-
case $return_value in 
    $DIALOG_OK)
              command ./apt-menu.sh 
              ;;
esac