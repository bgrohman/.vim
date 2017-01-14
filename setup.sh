#! /bin/bash
set -x
cwd=`pwd`
git submodule init
git submodule update
mkdir ~/.vim-backup
ln -s "$cwd" ~/.vim
