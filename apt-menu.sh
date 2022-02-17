#!/data/data/com.termux/files/usr/bin/bash


#GLOBAL VARIABLES
BKTITLE="APT-CLI by SUFandom (Dialog Version) 0.2-beta"
TITLE_HEADING="APT-CLI MENU"
TIME=$SECONDS
TITLE_STARTUP="APT-CLI"
TITLE_HEADING_B="APT-CLI ABOUT"
REL="0.2-beta"

#ERROR Variable, ASSETS RELATED
ROOT_DETECTED="uw-r#0"
MISSING_ASSETS="mis-187"


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

if (find /data)
then 
      dialog --backtitle "Error" --msgbox "You have android Superuser ROOT, Disengage Root access for Termux from your SuperUser and Try Again, Error Code: $ROOT_DETECTED." $HEIGHT $WIDTH
      sleep 3
     exit
else 
     dialog --backtitle "$BKTITLE" --infobox "Loading" $HEIGHT $WIDTH
     sleep 10
fi

#MENU
while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "$BKTITLE" \
    --title "$TITLE_HEADING" \
    --clear \
    --cancel-label "Exit" \
    --menu "Select: " 30 50 8 \
    "1" "APT Search Library" \
    "2" "APT Install Packages" \
    "3" "APT - CLI ABOUT" \
    "4" "APT - CLI HELP" \
    "5" "OPTIONS" \
    "6" "Patch Notes/Updates" \
    "7" "ANDROID INFO DETAILS" \
    2>&1 1>&3 )
  exit_status=$?
exec 3>&-
case $exit_status in 
     $DIALOG_CANCEL) 
         clear
         dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP" --infobox "Ending Process $PID with $?.. Together with Session" $HEIGHT $WIDTH
         sleep 5
         command ./apt-exit.sh
      ;;
     $DIALOG_ESC)
         clear
         dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP"  --infobox "PRESSED ESC KEY, Proceeding to Stop the process $PID with Error 1" 10 30
         sleep 5
         exit 1
         ;;
esac
case $selection in
     1 )
         clear ;
        dialog --backtitle "$BKTITLE" --title "APT-CLI" --infobox "Loading APT-Search" $HEIGHT $WIDTH ;
        sleep 3 ;
        command ./apt-search.sh
        ;;
     2)
    clear ;
       dialog --backtitle "$BKTITLE" --title "APT-CLI" --infobox "Loading APT Package Downloader and Installer" $HEIGHT $WIDTH ;
       sleep 5 ;
       command ./apt-install.sh
       ;;
     3)
       clear ; 
       dialog --backtitle "$BKTITLE" --title "APT-CLI ABOUT" --infobox "Loading About Page." $HEIGHT $WIDTH ;
       sleep 5 ;
       command ./apt-cli-about 
       ;;
     4)
       clear ;
       dialog --backtitle "$BKTITLE" --title "APT-CLI HELP" --infobox "Loading Help" $HEIGHT $WIDTH ;
       sleep 5 ;
       command ./apt-cli-help.sh
       ;;
     5) 
       clear ;
       dialog --infobox "$BKTITLE"  --title "APT OPTIONS (LIMITED)" $HEIGHT $WIDTH ;
       sleep 5 ;
       command ./apt-options.sh
       ;;
     6)
        clear ;
        dialog --backtitle "$BKTITLE" --title "APT-CLI Patch" --infobox "Loading Patch Release: $REL " $HEIGHT $WIDTH ;
        sleep 5 ;
        command ./apt-cli-patch.sh 
        ;;
     7) 
       clear ;
       command uname -a > uname.txt ;
       fold -w10 uname.txt ;
       dialog --backtitle "$BKTITLE" --title "Android Info Grabber" --textbox uname.txt $HEIGHT $WIDTH ;;
esac
done