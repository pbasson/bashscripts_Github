#!/bin/bash

# bash /app/bashscripts_github/bashscripts_github-M/MkDirs-Script/Alphabet-MkDirs/Alphabet-MkDirs.sh

# AUTHOR: PREETPAL BASSON
# PURPOSE: Make Directory from A to Z using current Directory. Will make either Normal or Static directories. Static means directory will not be deleted as empty, 
# PREREQUISITE: Execute from Current Directory to creates new Directories 

function header(){
    echo "-----------------------------"
    echo "# Script - $1"
    echo
}


function staticselect() {
    echo "Please Select An Directory Builder?"
    select list in Normal Normal_ToSort Static Static_ToSort Exit
    do
        case $list in
                Normal)
                    IS_STATIC=false
                    IS_SORT=false
                    echo && echo " $list Has Been Selected "
                    break
                ;;
                Normal_ToSort)
                    IS_STATIC=false
                    IS_SORT=true
                    echo && echo " $list Has Been Selected "
                    break
                ;;
                Static)
                    IS_STATIC=true
                    IS_SORT=false
                    echo && echo " $list Has Been Selected "
                    break
                ;;
                Static_ToSort)
                    IS_STATIC=true
                    IS_SORT=true
                    echo && echo " $list Has Been Selected "
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
    FULL_PATH="$PWD"
    CUR_DIR=${PWD##*/}
    IS_STATIC=false
    IS_SORT=false
    T_CHAR="T"
}

header "START"

initialize

staticselect

for n in {A..Z}
do
    CUR_PATH=$(printf "$FULL_PATH/$CUR_DIR-$n")
    
    if [ ! -d $CUR_PATH ]; then
        mkdir -vp "$CUR_PATH"
    fi
    if [[ -d $CUR_PATH && "$IS_STATIC" = true ]]; then
        touch "$CUR_PATH/.$CUR_DIR-$n"
        echo "$(printf "$CUR_DIR-$n")/.$CUR_DIR-$n" >> "$CUR_PATH/.$CUR_DIR-$n"
    fi
    if [[ "$n" == "$T_CHAR" && "$IS_SORT" == "true" ]]; then
        mkdir -vp "$CUR_PATH/ToSort-$CUR_DIR/ToSort-$CUR_DIR-001"
    fi
done 

header "END"
