#!/bin/bash -e

DIR=$(dirname $0)

os_name=`uname`

echo Install cmake, vim, g++, ack and ruby
if [[ "$os_name" == "Linux" ]]; then
  sudo apt-get install cmake
  sudo apt-get install vim
  sudo apt-get install g++7
  sudo apt-get install ack-grep
  sudo apt-get install ruby-dev
  sudo add-apt-repository ppa:longsleep/golang-backports
  sudo apt-get update
  sudo apt-get install golang-go
elif [[ "$os_name" == "Darwin" ]]; then
  brew install cmake || brew upgrade cmake
  brew install vim || brew upgrade vim
  brew install gcc || brew upgrade gcc
  brew install ack || brew upgrade ack
  brew install ruby-dev || brew upgrade ruby-dev
  brew install go || brew upgrade go
fi

echo Install Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo Install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer
cd $DIR

echo Install command-t
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
cd $DIR

echo Install dotfiles
cp $DIR/bashrc ~/.bashrc
cp $DIR/vimrc ~/.vimrc
cp $DIR/gitconfig ~/.gitconfig
mkdir -p ~/bin
cp $DIR/build ~/bin/

echo Update bashrc
source ~/.bashrc

echo Install vim plugins
vim +PluginInstall +qall
