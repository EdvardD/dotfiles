#!/bin/bash -e

DIR=`pwd`

os_name=`uname`

echo Install cmake, vim, g++, ack and ruby
if [[ "$os_name" == "Linux" ]]; then
  sudo apt-get install -y software-properties-common
  if [[ "$(lsb_release -d)" == *"18.04"* ]]; then
    sudo add-apt-repository -y ppa:longsleep/golang-backports
  fi
  sudo apt-get update
  sudo apt-get --assume-yes install cmake vim ack-grep ruby-dev golang-go python3 python3-pip curl tmux gdb htop tig
  if [[ "$(lsb_release -d)" == *"18.04"* ]]; then
    sudo apt-get --assume-yes install g++-8
  fi
else
  echo "expected ubuntu"
  exit
fi

echo Install Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ "$1" = "--ycm" ] ; then
  echo Install YCM
  rm -rf ~/.vim/bundle/YouCompleteMe
  git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  cd ~/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  python3 install.py --clang-completer --gocode-completer --rust-completer
fi

cd $DIR/dotfiles

echo Install dotfiles
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
cp tmux.conf ~/.tmux.conf

echo Update bashrc
source ~/.bashrc

echo Install molokai vim colors
mkdir -p ~/.vim/colors
cp molokai.vim ~/.vim/colors/

echo Install vim plugins
vim +PluginInstall +qall

echo Install Go binaries
vim +GoInstallBinaries +qall
