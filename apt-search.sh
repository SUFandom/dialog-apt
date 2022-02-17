#!/data/data/com.termux/files/usr/bin/bash

#GLOBAL VARIABLES
BKTITLE="APT-CLI by SUFandom (Dialog Version) 0.2-beta"
TITLE_HEADING="APT-CLI MENU"
TIME=$SECONDS
TITLE_SEARCH="APT SEARCH"
TITLE_STARTUP="APT-CLI"
TITLE_HEADING_B="APT-CLI ABOUT"
variable=${log}

#Height-Width Default Variable (GLOBAL VARIABLES)
HEIGHT=0
WIDTH=0

#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}



#DISPLAY RESULT OVERHEAD
display_result () { 
    dialog --backtitle "$BKTITLE" --title "$1" \
    --no-collapse \
    --msgbox "$RESULT" 0 0
}

#Exec on backup
#Duplicate!
exec 3>&1


#Temporary File, for apt output
#the echo part here is purposely empty
#I dont even know why i made this
if (find aptsearchlog)
then
     echo ""
else
     touch aptsearchlog
fi


#Input Boxes

exec 3>&1
result=$(dialog \
         --backtitle "$BKTITLE" \
         --title "$TITLE_SEARCH" \
         --clear \
         --inputbox "Type to search, It is case sensitive, adding space also adds the item to result unless you add a 2 dquote mark in between. See Help for reference." \
         $HEIGHT $WIDTH 2>&1 1>&3  )
#Exit Value Grabbers
return_value=$?
exec 3>-
#Act on run
 case $return_value in
     $DIALOG_OK)
         command apt search $result > aptsearchlog.txt ;
         dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP" --infobox "Did you know, after you typed your results, you can use up, down, left, and right key on Termux to see the full description." $HEIGHT $WIDTH ;
         sleep 8 ;
         dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP" --textbox aptsearchlog.txt  20 50 ;
         rm -rf aptsearchlog.txt ;
         command ./apt-search.sh ;;
     $DIALOG_CANCEL)
         dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP" --infobox "Wait" $HEIGHT $WIDTH  ;
         sleep 5 ;
         command ./apt-menu.sh ;;
     $DIALOG_HELP)
         clear ;
         echo "Loading Help" ;
         command ./apt-cli-help.sh ;;
     $DIALOG_EXTRA)
         echo "Soon" ;
         sleep 5 ;
         command ./apt-search.sh ;;
     $DIALOG_ITEM_HELP)
         echo "This feature isnt available as of now. Please wait soon" ;
         sleep 5 ;
         command ./apt-search.sh ;;
     $DIALOG_ESC)
         command ./apt-menu.sh ;;
esac
