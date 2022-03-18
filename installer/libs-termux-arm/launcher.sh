#!/bin/env bash

cd installer/libs-termux-arm

echo "Creatinng.."
if (mkdir $HOME/.apt-dialog)
then 
  echo "Dir Created."
else 
  echo "Directory may have been existed or triggered an Error. please check at your $HOME directory and type ls -a and make sure, $(tput setaf 1)'.apt-dialog'$(tput sgr0) is present."
fi
if (find $HOME/apt-dialog/log)
then
  clear
else
  touch $HOME/.apt-dialog/log
  clear
fi

echo "If any Chance that the installation failed because you did something wrong or the script does, use the command 'cp' and send it to usr/bin to make it work. If not, please tell me at Github about the issue with Detail, your device specs and your Termux Version. "
echo "The assets however, you should copy them to $HOME/.apt-dialog to work."
sleep 10
clear
echo "Termux Home Directory, $HOME"
echo "Please copy & remove the 'home' part and replace it with usr/bin to successfully install"
sleep 10
REL="1.0.2 (Kronos)"
BT="Dialog APT Installer SCRIPT - $REL"
TITLE="DIALOG-APT INSTALLER SCRIPT"

MISSING_FILE_INS_START="mis-ins-core=NULL"
MISSING_FILE_OTHERS="mis-ins-res=NULL"

NO_PERMS_INS="perm-ins-x"
NO_PERMS_LIVE="perm-ins-x"


: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

HEIGHT=0
WIDTH=0



clear
sleep 3
echo "Temporarily removing the Terminal Cursor"
sleep 5
tput civis
echo "Terminal Cursor Removed"
sleep 1

echo "Finding Assets"
sleep 5
if (find apt-dialog )
then
clear
echo -ne 'Progress: (Finding Assets):           (00%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): #         (10%)\r'
sleep 2
else 
echo  "Missing File, >'apt-dialog'<, Error: $MISSING_FILE_INS_START, Ending Process to avoid issues"
sleep 4
exit 1
fi
if (find apt-dialog-autorem )
then
clear
echo -ne 'Progress: (Finding Assets): #         (10%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ###       (29%)\r'
sleep 2
else
echo "Missing File, >'apt-dialog-autorem.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find apt-dialog-install)
then
clear
echo -ne 'Progress: (Finding Assets): ###       (29%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ####      (42%)\r'
sleep 2
else
echo "Missing File, >'apt-dialog-install'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find apt-dialog-remove)
then
clear
echo -ne 'Progress: (Finding Assets): ####      (42%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): #####     (56%)\r'
sleep 2
else 
echo  "Missing File, >'apt-dialogremove'<, Error: $MISSING_FILE_OTHERS, Ending Process to avoid issues"
sleep 4
exit 1
fi
if (find apt-dialog-search)
then
clear
echo -ne 'Progress: (Finding Assets): #####     (56%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ######    (67%)\r'
sleep 2
else
echo "Missing File, >'apt-dialog-search'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find apt-dialog-update)
then
clear
echo -ne 'Progress: (Finding Assets): ######    (67%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ########  (80%)\r'
sleep 2
tput setaf 2
echo -ne 'Progress: (Complete Finding Assets): ##########(100%)\r'
sleep 3
tput sgr0
else
echo "Missing File, >'apt-dialog-update'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
exec 3>&1
input=$( dialog --backtitle "$BT" \
  --title "$TITLE" \
  --clear \
  --yes-label "Proceed" \
  --no-label "Abort" \
  --inputbox "Hey there, Since Android Devices are Different, Data Directory Structures sure are different either. So i want you to input where your termux's core data library to Copy the file. Its better if you have termux-ohmyzsh installed cuz you can easily know where it is. Now you just need to type, where's your 'bin' located. And the installer will continue Aborting it stops the installation as part of Safety Reasons. Dont forget to put '/' first or it will not work. like: /data/data/com.termux/files/usr/bin . Also Mistakenly Inputting Something will do Harm on your Termux App in a Bad way (Possibly). But if you copied the Warning Earlier, then paste it her and replace it from /home to usr/bin. " \
  $HEIGHT $WIDTH 2>&1 1>&3 \
  )
exit_sniffer=$?
exec 3>&-
case $exit_sniffer in
 $DIALOG_OK)
 echo "Hold on."
 sleep 2
 clear
 dialog -+backtitle "$BT" --title "$TITLE" --infobox "Wait for it." $HEIGHT $WIDTH
 sleep 3
 cp apt-dialog apt-dialog-autorem apt-dialog-install apt-dialog-update apt-dialog-remove apt-dialog-search $input
find $input/apt-dialog
cp apt-dialog-res/patch.txt help.txt about.txt $HOME/.apt-dialog/
dialog --backtitle "$BT" --title "$TITLE" --infobox "Starting"
sleep 5
tput cnorm
echo "User installed the script at $(date +%F_%H-%M-%S)" >> $HOME/.apt-dialog/log
apt-dialog
;;
 $DIALOG_CANCEL)
 clear
 echo "$(tput setaf 1) Aborting ..$(tput sgr0)"
 sleep 3
 echo "Cleaning Leftovers"
 sleep 3
 rm -rf $HOME/.apt-dialog
 echo "Done"
 tput cnorm
 exit 1
 ;;
esac
