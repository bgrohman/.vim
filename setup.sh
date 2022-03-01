#! /bin/bash
set -x
git submodule init
git submodule update
mkdir ~/.vim-backup
mkdir ~/.vim-workspaces

# Only do this if you're not cloning into ~/.vim directly.
cwd=$(pwd)
ln -s "$cwd" ~/.vim

# WINDOWS
# Create link for vimfiles directory.
# mklink /D C:\Users\<user>\vimfiles <path_to_.vim_directory>
# Create link for spell directory.
# mklink /D C:\Users\<user>\vimfiles\spell C:\Users\<user>\.vim-spell
