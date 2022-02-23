#!/data/data/com.termux/files/usr/bin/bash


#GLOBAL VARIABLES
REL="0.5-beta (Luz)"
BKTITLE="APT-CLI by SUFandom (Dialog Version) $REL"
TITLE_HEADING="APT-CLI MENU"
TIME=$SECONDS
TITLE_STARTUP="APT-CLI"
TITLE_HEADING_B="APT-CLI ABOUT"
VS_BASH=command bash -c 'echo $BASH_VERSION'
VS_ZSH=command zsh --version



#Height-Width Default Variable (GLOBAL VARIABLES)
HEIGHT=0
WIDTH=0

#EXIT SNIFFERS
exit_status=$?


#DIALOG VALUE DEFINERS
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

#Added Error String
: ${EXECUTED=5}
: ${MISSING_FILE=187}

#DISPLAY RESULT OVERHEAD
display_result () { 
    dialog --backtitle "$BKTITLE" --title "$1" \
    --no-collapse \
    --msgbox "$?" 0 0
}

#Script Startup
clear 
for ((i=0; i<=5; i++)); do echo "Version of Bash: BASH_VERSINFO[$i] = ${BASH_VERSINFO[$i]}"; done
sleep 3
clear
echo "Warning, there will be some flickering  " 
echo "This is just Dialog Engine having seizures  " 
echo "Due to the 'for' function. sorry" 
sleep 3

for i in $(seq 0 20 100) ; do sleep 0.5 ; echo $i | dialog --backtitle "$BKTITLE" --gauge "Loading, Please Wait" 10 50 0 ; done

#Scanning if you set Termux to Root
#By checking if it can read /data because only SuperUser Privilege to check it.
#if you're running this on Debian and other full-fledged Linux distros, please don't proceed even further, even in Termux-proot.
if ( find /data )
then dialog  --backtitle "$BKTITLE"   --infobox "You are in Super User, $USER, Disengage Root and proceed, Script Broadcasted $?, means Termux is in Root mode " 10 30
     sleep 3
     dialog --backtitle "$BKTITLE" --infobox "Killing Termux Terminal Session $PID" 8 30
      sleep 1
     dialog --backtitle "$BKTITLE" --infobox "Remove Root Privileges, executing Exit code $?" 13 40
     sleep 5
     exit
else echo "Device in NoRoot, Proceeding..."
     sleep 3
fi


#P1 - Phase 1
clear
sleep 2
echo "$? - Code System Flareback"
dialog --infobox "Initialization Starting" 10 50
sleep 5
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
clear
echo "You are $SECONDS seconds,  now into the Terminal"
sleep 1
echo "hibernating 'seconds' temporarily."
sleep 0.5
echo "hibernating 'seconds' temporarily.."
sleep 0.5
echo "hibernating 'seconds' temporarily..."
sleep 0.5
echo "hibernating 'seconds' temporarily...."
sleep 0.5
echo "hibernating 'seconds' temporarily....."
sleep 0.5
echo "hibernating 'seconds' temporarily......"
sleep 3
clear
printf '%s\n' "Warning, There will be a Prompt by asking you to Enter your Terminal Environment, you can choose Option 3 if you Dont Know." | fold -s
sleep 3
exec 3>&1 
console=$( dialog \
             --backtitle "Identify your CL" \
             --title "Select Console Environment" \
             --clear \
             --cancel-label "Cancel" \
             --ok-label "Proceed" \
             --menu "Select your Installed Console. Choose Carefully, More Support Soon, this method is just for future Reference, this is still beta"  30 60 4 \
             "1" "BASH - THE BOURNE AGAIN SHELL v.5 and Newer" \
             "2" "ZSH - Primarily OMZ (Oh My Zsh) - " \
             "3" "OTHERS/UNKNOWN OR UNSPECIFIED" \
             2>&1 1>&3 )
exit_status=$?
exec 3>&-
case $exit_status in 
     $DIALOG_CANCEL)
     dialog --backtitle "Cancel operend" --infobox "Cancelling Process, warning, any issues may appear in later versions" $HEIGHT $WIDTH  ;
     sleep 2
     ;; 
esac
case $console in
     1)
      clear ;
      printf "Bash Version is $VS_BASH" > .shconfig ;
      dialog --infobox "bash: $VS_BASH" $HEIGHT $WIDTH ;
      sleep 3
      ;;
     2)
      clear ;
      printf "ZSH or OMZ version is: $VS_ZSH" > .shconfig ;
      dialog --infobox "Zsh: $VS_ZSH" $HEIGHT $WIDTH ;
      sleep 3
      ;;
     3) 
      clear ;
      printf "auto" > .shconfig
      dialog --infobox "Unspecified, AUTO MODE" $HEIGHT $WIDTH ;
      sleep 3
      ;;
esac
clear
echo "Starting up"
sleep 15
if ( dialog --backtitle "$BKTITLE" --yesno "Ready to Use the APT-CLI?" 10 25 )
then  
     dialog --backtitle "$BKTITLE" --infobox "Initializing" 15 60
     sleep 3 
else 
     dialog --backtitle "$BKTITLE" --infobox "Killing Script Process $PID. Exiting Termux" 15 60
     sleep 5
     exit
fi
#Temporary File, via user input
tmp_file=$( tempfile 2>/data/data/com.termux/files/usr/tmp ) || tmp_file=/data/data/com.termux/files/usr/tmp/temp_test$$ 
trap "rm -rf $tmp_file" 0 1 2 5 15

dialog --backtitle "$BKTITLE" --title "$TITLE_STARTUP" --infobox "Starting" 15 35
sleep 5

#Launch
if ( find apt-menu.sh )
then
     sleep 5
     dialog --backtitle "$BKTITLE" --infobox "Initializing Menu, Code: $EXECUTED" $HEIGHT $WIDTH 
     sleep 3
     command ./apt-menu.sh
else
     sleep 5
     dialog --backtitle "$BKTITLE" --infobox "Couldn't find the resources to start the menu, please try to perform Git clone Repo or report as issue, ERR CODE: xcc$MISSING_FILE" $HEIGHT $WIDTH
     sleep 10
     exit 1
fi

