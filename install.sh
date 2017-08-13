#!/bin/bash -e

git submodule update --init

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
mkdir -p ~/.vim
cp -r bundle ~/.vim/

source ~/.bashrc
vim +PluginInstall +qall
