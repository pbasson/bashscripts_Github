#!/bin/bash

# bash /app/bashscripts_github/bashscripts_github-F/Find-Script/FilesList-Script/FilesList-Script.sh

# AUTHOR: PREETPAL BASSON
# PURPOSE: Find all files and output to file. 
# PREREQUISITE: Execute from Anywhere 

function header(){
    echo "-----------------------------"
    echo "# Script - $1"
    echo
}

function entry_select() {
    echo "Select?"
    select list in Find-NotHidden Find-Hidden Tree Both-NotHidden Both-Hidden Exit
    do
        case $list in
                Find-NotHidden)
                    echo && echo "$list Has Been Selected "
                    IS_TREE=false
                    IS_BOTH=false
                    IS_NOTHIDDEN=true
                    break
                ;;
                Find-Hidden)
                    echo && echo "$list Has Been Selected "
                    IS_TREE=false
                    IS_BOTH=false
                    IS_NOTHIDDEN=false
                    break
                ;;
                Tree)
                    echo && echo "$list Has Been Selected "
                    IS_TREE=true
                    break
                ;;
                Both-NotHidden)
                    echo && echo "$list Has Been Selected "
                    IS_TREE=false
                    IS_BOTH=true
                    IS_NOTHIDDEN=true
                    break
                ;;
                Both-Hidden)
                    echo && echo "$list Has Been Selected "
                    IS_TREE=false
                    IS_BOTH=true
                    IS_NOTHIDDEN=false
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
    FILE_OUT="FILES"
    TREE_OUT="TREE"
    TIME_STAMP=$(date "+%Y-%m-%d %H:%M:%S")
    IS_TREE=false
    IS_BOTH=false
    IS_NOTHIDDEN=true
}

function set_outfile() { 
    OUT_FILE="${CUR_DIR}_$1.txt"
}

function outfile_for_find() {
    set_outfile $FILE_OUT
    if [[ "$IS_NOTHIDDEN" == "true" ]];then
        find . -not -path '*/\.*' -type f | sort > $OUT_FILE
    else 
        find . -type f | sort > $OUT_FILE
    fi
    echo ${TIME_STAMP} >> $OUT_FILE
}

function outfile_for_tree() {
    set_outfile $TREE_OUT
    tree . > $OUT_FILE
    echo ${TIME_STAMP} >> $OUT_FILE
}

header 'START' && echo
initialize

entry_select

if [[ "$IS_BOTH" == true && "$IS_TREE" == false ]]; then
    outfile_for_find

    outfile_for_tree

elif [[ "$IS_BOTH" == false && "$IS_TREE" == true ]]; then
    outfile_for_find
    
    outfile_for_tree
else
    outfile_for_find
fi

echo && header 'END'
