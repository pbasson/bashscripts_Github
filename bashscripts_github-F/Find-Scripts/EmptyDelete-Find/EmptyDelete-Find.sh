#!/bin/bash

# bash /app/bashscripts_github/bashscripts_github-F/Find-Script/EmptyDelete-Find/EmptyDelete-Find.sh

# AUTHOR: PREETPAL BASSON
# PURPOSE: Delete all empty Directories. This will only remove empty Directories
# PREREQUISITE: Execute from Current Parent Directory

header(){
    echo "-----------------------------"
    echo "# Script - $1"
    echo
}

header "START"

find . -type d -empty -delete
echo $PWD

header "END"
