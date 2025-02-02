#!/bin/bash
function process_output {
    line=$(tail -n 2  | head -n 1)
    if [[ $line =~ Latexmk:\ All\ targets\ \((.*)\)\ are\ up-to-date ]]; then
        test -d ${ZED_WORKTREE_ROOT}/.zed/ || mkdir -p ${ZED_WORKTREE_ROOT}/.zed/
        echo "$(pwd)/${BASH_REMATCH[1]}" > ${ZED_WORKTREE_ROOT}/.zed/OUTPUT_PDF #$1
    else
        echo "ERROR: PDF path not found in \"$line\"" >&2
    fi
}

latexmk -pdf -synctex=1 -recorder $1 | tee >(cat) | process_output
wait -n
