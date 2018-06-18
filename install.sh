#!/bin/bash -e

DIR=`pwd`

os_name=`uname`

echo Install cmake, vim, g++, ack and ruby
if [[ "$os_name" == "Linux" ]]; then
  sudo apt-get --assume-yes install cmake
  sudo apt-get --assume-yes install vim
  sudo apt-get --assume-yes install g++-7
  sudo apt-get --assume-yes install ack-grep
  sudo apt-get --assume-yes install ruby-dev
  sudo apt-get --assume-yes install golang-go
  sudo apt-get --assume-yes install python
  sudo apt-get --assume-yes install python3
  sudo apt-get --assume-yes install python-pip
elif [[ "$os_name" == "Darwin" ]]; then
  brew install cmake || brew upgrade cmake
  brew install vim || brew upgrade vim
  brew install gcc || brew upgrade gcc
  brew install ack || brew upgrade ack
  brew install ruby || brew upgrade ruby
  brew install go || brew upgrade go
  brew install python || brew upgrade python
  brew install python3 || brew upgrade python3
fi

echo Install Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo Install YCM
rm -rf ~/.vim/bundle/YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --gocode-completer
cd $DIR

echo Install command-t
rm -rf ~/.vim/bundle/command-t/ruby
git clone https://github.com/wincent/command-t.git ~/.vim/bundle/command-t
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
cd $DIR/dotfiles

echo Install dotfiles
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig
mkdir -p ~/bin
cp build ~/bin/

echo Update bashrc
source ~/.bashrc

echo Install molokai vim colors
mkdir -p ~/.vim/colors
cp molokai.vim ~/.vim/colors/

echo Install vim plugins
vim +PluginInstall +qall

echo Install Go binaries
vim +GoInstallBinaries +qall
