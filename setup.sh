#! /bin/bash
set -x
cwd=`pwd`
git submodule init
git submodule update
mkdir ~/.vim-backup
mkdir ~/.vim-workspaces

# Only do this if you're not cloning into ~/.vim directly.
# ln -s "$cwd" ~/.vim

# WINDOWS
# Create link for vimfiles directory.
# mklink /D C:\Users\<user>\vimfiles <path_to_.vim_directory>
