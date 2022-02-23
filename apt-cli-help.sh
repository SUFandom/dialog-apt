#!/data/data/com.termux/files/usr/bin/env sh
#Help Documentation Selection

#DIALOG HEIGHT AND WIDTH PARAMS
HEIGHT=0
WIDTH=0

#DIALOG EXIT VARS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}

#Error Variable 
MISSING_FILE="mis-187/inf=0"

#Global Vars
TITLE="APT-CLI HELP PAGE"
REL="0.5-beta (Luz)"
BKT="APT-CLI by SUFandom (Dialog Version) $REL"


#Inputboxes

if ( find help.txt )
then 
     dialog --backtitle "$BKT" --title "$TITLE" --infobox "Loading Help Page" $HEIGHT $WIDTH
     sleep 5
else
     dialog --backtitle "$BKT" --title "ERROR" --infobox "Help File Missing, Screenshot the Error to Report on Github: ERROR: $MISSING_FILE" $HEIGHT $WIDTH
     sleep 5
     command ./apt-menu.sh
fi
exec 3>&1
dialog --backtitle "$BKT" --title "HELP" --textbox help.txt 35 60
#Exit Grabbers
return_value=$?
exec 3>&-
case $return_value in 
    $DIALOG_OK)
              command ./apt-menu.sh 
              ;;
     $DIALOG_ESC)
              command ./apt-menu.sh
              ;;
esac
