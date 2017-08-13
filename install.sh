#!/bin/bash -e

os_name=`uname`

if [[ "$os_name" == "Linux" ]]; then
  sudo apt-get install cmake
  sudo apt-get install vim
  sudo apt-get install g++7
  sudo apt-get install ack-grep
elif [[ "$os_name" == "Darwin" ]]; then
  brew install cmake || brew upgrade cmake
  brew install vim || brew upgrade vim
  brew install gcc || brew upgrade gcc
  brew install ack || brew upgrade ack
fi

rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
cp build /usr/local/bin

source ~/.bashrc
vim +PluginInstall +qall
