#!/bin/bash

# bash /app/bashscripts_github/bashscripts_github-F/Find-Script/DirectoryList-Script/DirectoryList-Find.sh

# AUTHOR: PREETPAL BASSON
# PURPOSE: Find all Directory and output to file with Hidden and MaxDepth filters 
# PREREQUISITE: Execute from Anywhere 

function header(){
    echo "-----------------------------"
    echo "# Script - $1"
    echo
}

function entry_select() {
    echo "Select?"
    select list in Find-NotHidden Find-Hidden  MaxDepth-NotHidden MaxDepth-Hidden Exit
    do
        case $list in
                Find-NotHidden)
                    echo && echo "$list Has Been Selected "
                    IS_DEPTH=false
                    IS_NOTHIDDEN=true
                    break
                ;;
                Find-Hidden)
                    echo && echo "$list Has Been Selected "
                    IS_DEPTH=false
                    IS_NOTHIDDEN=false
                    break
                ;;
                MaxDepth-NotHidden)
                    echo && echo "$list Has Been Selected "
                    IS_DEPTH=true
                    IS_NOTHIDDEN=true
                    input_name
                    break
                ;;
                MaxDepth-Hidden)
                    echo && echo "$list Has Been Selected "
                    IS_DEPTH=true
                    IS_NOTHIDDEN=false
                    input_name
                    break
                ;;
                Exit)
                    echo && echo "Script will now exit"
                    exit
                    break
                ;;
                *)
                    echo "Invalid Option"
                ;;
        esac
    done
}

function initialize() {
    CUR_DIR=${PWD##*/}
    DIR_OUT="DIR"
    TIME_STAMP=$(date "+%Y-%m-%d %H:%M:%S")
    IS_DEPTH=false
    IS_NOTHIDDEN=true
}

function input_name() {
     read -rp "MaxDepth: " input
}

function set_outfile() { 
    OUT_FILE="${CUR_DIR}_$1.txt"
}

function outfile_for_find() {
    set_outfile $DIR_OUT
    if [[ "$IS_DEPTH" == "true" ]];then
        MAXDEPTH_FIND="-maxdepth $input"
    fi 
    if [[ "$IS_NOTHIDDEN" == "true" ]];then
        find . $MAXDEPTH_FIND -not -path '*/\.*' -type d | sort > $OUT_FILE
    else
        find . $MAXDEPTH_FIND -type d | sort > $OUT_FILE
    fi 

    echo ${TIME_STAMP} >> $OUT_FILE
}

header 'START' && echo

initialize

entry_select

outfile_for_find

echo && header 'END'
