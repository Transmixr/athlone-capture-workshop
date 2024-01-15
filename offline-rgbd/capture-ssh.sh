#!/bin/bash

ssh_in_terminal() {
    local where="$1"
    local what="$2"
    local command="ssh ${where} '${what}'"
    local osascript="tell app \"Terminal\"
            do script \"${command}\"
        end tell
        "
    osascript -e "${osascript}"
}

set -vx
cmd='echo \"hello       world\"'
ssh_in_terminal localhost "${cmd}"
ssh_in_terminal flauwte.dis.cwi.nl "${cmd}"
