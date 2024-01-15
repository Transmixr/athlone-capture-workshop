#!/bin/bash

# Globl variables that are the same over the qwhole session

colormode=1536p
depthmode=NFOV_UNBINNED
rate=30

ssh_in_terminal() {
    local where="$1"
    local what="$2"
    local command="sshpass -p 'p-ranger' ssh -t ${where} '${what}'"
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
    
    echo "cmd /k \\\"C:/Program Files/Azure Kinect SDK v1.4.1/tools/k4arecorder\\\" --device ${devicenum} --color-mode ${colormode} --depth-mode ${depthmode} --rate ${rate} --imu OFF --external-sync ${syncmode} --sync-delay ${syncdelay} --exposure-control 33000 ${hostname}_${devicenum}_${sessionid}.mkv 2^> ${hostname}_${devicenum}_${sessionid}_error.txt"
}

set -vx
sessiontime=01151653
remote_cmd=`remote_command disnuc103 ${sessiontime} 0 Sub 160`
ssh_in_terminal dis@disnuc103.huiskamer.private "${remote_cmd}"
sleep 1
remote_cmd=`remote_command disnuc202 ${sessiontime} 0 Sub 320`
ssh_in_terminal dis@disnuc202.huiskamer.private "${remote_cmd}"
sleep 1
remote_cmd=`remote_command disnuc301 ${sessiontime} 0 Sub 480`
ssh_in_terminal dis@disnuc301.huiskamer.private "${remote_cmd}"
sleep 1
remote_cmd=`remote_command topinambur ${sessiontime} 0 Sub 640`
ssh_in_terminal dis@topinambur.huiskamer.private "${remote_cmd}"
sleep 1
remote_cmd=`remote_command topinambur ${sessiontime} 1 Sub 800`
ssh_in_terminal dis@topinambur.huiskamer.private "${remote_cmd}"
sleep 1
remote_cmd=`remote_command topinambur ${sessiontime} 2 Sub 960`
ssh_in_terminal dis@topinambur.huiskamer.private "${remote_cmd}"
sleep 1

remote_cmd=`remote_command disnuc101 ${sessiontime} 0 Master 0`
ssh_in_terminal dis@disnuc101.huiskamer.private "${remote_cmd}"
