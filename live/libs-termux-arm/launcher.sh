#!/bin/env bash

cd live/libs-termux-arm

REL="1.0.2 (Kronos)"
BT="Dialog APT LIVE SCRIPT - $REL"
TITLE="DIALOG-APT LIVE SCRIPT"

MISSING_FILE_LIVE_START="mis-lve-core=NULL"
MISSING_FILE_OTHERS="mis-lve-res=NULL"

NO_PERMS_INS="perm-ins-x"
NO_PERMS_LIVE="perm-lve-x"


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
if (find corelib.sh )
then
clear
echo -ne 'Progress: (Finding Assets):           (00%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): #         (10%)\r'
sleep 2
else 
echo  "Missing File, >'assets/main.sh'<, Error: $MISSING_FILE_LIVE_START, Ending Process to avoid issues"
sleep 4
exit 1
fi
if (find autorem.sh )
then
clear
echo -ne 'Progress: (Finding Assets): #         (10%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ###       (29%)\r'
sleep 2
else
echo "Missing File, >'assets/autorem.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find install.sh)
then
clear
echo -ne 'Progress: (Finding Assets): ###       (29%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ####      (42%)\r'
sleep 2
else
echo "Missing File, >'assets/install.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find remove.sh)
then
clear
echo -ne 'Progress: (Finding Assets): ####      (42%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): #####     (56%)\r'
sleep 2
else 
echo  "Missing File, >'assets/remove.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process to avoid issues"
sleep 4
exit 1
fi
if (find search.sh)
then
clear
echo -ne 'Progress: (Finding Assets): #####     (56%)\r'
sleep 1
echo -ne 'Progress: (Finding Assets): ######    (67%)\r'
sleep 2
else
echo "Missing File, >'assets/search.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
if (find update.sh)
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
echo "Missing File, >'assets/update.sh'<, Error: $MISSING_FILE_OTHERS, Ending Process Abruptly to avoid Issues"
sleep 4
exit 1
fi
clear
echo 'Finalizing'
sleep 1
printf "Core Script Ended in: $SECONDS with Code Exit Number $?" >> .debug-launcher-opt
sleep 5
clear
echo "Returning the Terminal Cursor"
sleep 2
tput cnorm
echo "Done"
sleep 3
command ./corelib.sh
