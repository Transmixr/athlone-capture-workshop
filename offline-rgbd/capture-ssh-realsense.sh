#!/bin/bash

# Globl variables that are the same over the qwhole session
if [ $# -ne 1 ]; then
    echo Usage $0 session name
    exit 1
fi
sessionname=$1

if [ -d ${sessionname} ]; then
    echo Session ${sessionname} already exists
    exit 1
fi

colormode=720p
depthmode=NFOV_UNBINNED
rate=5

ssh_in_terminal() {
    local where="$1"
    local what="$2"
    local command="ssh -i ~/.ssh/id_disnuc -t ${where} '${what}'"
    local osascript="tell app \"Terminal\"
            set new_tab to do script \"${command}\"
            set custom title of new_tab to \"${where}\"
            set background color of new_tab to \"yellow\"
        end tell
        "
    osascript -e "${osascript}"
}

remote_command() {
    local hostname="$1"
    local sessionid="$2"
    local devicenum="$3"
    local syncmode="$4"
    local syncdelay="$5"
    
    echo "cmd /k python athlone-capture-workshop/offline-rgbd/rspython/rs-python-recorder.py ${hostname}_${devicenum}_${sessionid}.bag 2^> ${hostname}_${devicenum}_${sessionid}_error.txt"
}

set -vx
#  42
# remote_cmd=`remote_command disnuc103 ${sessionname} 0 Sub 160` 42
# ssh_in_terminal dis@disnuc103.local "${remote_cmd}" 42
# sleep 1 42
# remote_cmd=`remote_command disnuc202 ${sessionname} 0 Sub 320` 42
# ssh_in_terminal dis@disnuc202.local "${remote_cmd}" 42
# sleep 1 42
# remote_cmd=`remote_command disnuc301 ${sessionname} 0 Sub 480` 42
# ssh_in_terminal dis@disnuc301.local "${remote_cmd}" 42
# sleep 1 42
# remote_cmd=`remote_command iti-nuc-02 ${sessionname} 0 Sub 800` 42
# ssh_in_terminal iti-nuc@iti-nuc-02.local "${remote_cmd}" 42
# sleep 1 42
# remote_cmd=`remote_command iti-nuc-03 ${sessionname} 0 Sub 960` 42
# ssh_in_terminal iti-nuc@iti-nuc-03.local "${remote_cmd}" 42
# sleep 1 42
# remote_cmd=`remote_command iti-nuc-04 ${sessionname} 0 Sub 1120` 42
# ssh_in_terminal iti-nuc@iti-nuc-04.local "${remote_cmd}" 42
# sleep 1 42

remote_cmd=`remote_command disnuc101 ${sessionname} 0 Sub 640`
ssh_in_terminal dis@disnuc101.local "${remote_cmd}"
sleep 1
# remote_cmd=`remote_command iti-nuc-01 ${sessionname} 0 Master 0`
# ssh_in_terminal iti-nuc@iti-nuc-01.local "${remote_cmd}"
