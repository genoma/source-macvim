#!/bin/bash

cp brew-python.patch ~/macvim
cd ~/macvim

git checkout -- .
make clean
make distclean

echo ""
echo -n "$(tput setaf 1)Apply patch for Homebrew Python? $(tput bold)[Y/n] $(tput sgr 0)"
read python

if [ "$python" != "n" ]; then
  patch ~/macvim/src/auto/configure < brew-python.patch
  rm brew-python.patch
else
  rm brew-python.patch
fi

echo ""
echo "$(tput setaf 1) $(tput bold)There are 3 possible MacVim compile configuration: $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *1) Complete -> Python/Ruby/Lua/Perl $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *2) Essential -> Python $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *3) Minimal $(tput sgr 0)"
echo ""
echo -n "$(tput setaf 1)What version would you like to compile? $(tput bold)[1/$(tput setaf 4)2$(tput setaf 1)/3] $(tput sgr 0)"
read compile


echo ""
if [ "$compile" == "1" ]; then
  # complete compilation with lua/ruby/python/perl
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --enable-rubyinterp\
              --enable-luainterp\
              --with-lua-prefix=/usr/local\
              --enable-perlinterp\
              --enable-pythoninterp\
              --disable-netbeans\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
elif [ "$compile" == "3" ]; then
  # minimal compilation with huge no lua/ruby/perl/python
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --disable-netbeans\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
else
  # essential compilation whith just Homebrew Python 2.7.X
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --disable-netbeans\
              --enable-pythoninterp\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
fi

echo ""
echo -n "$(tput setaf 1)Shall we proceed with compiling MacVim? $(tput bold)[Y/n] $(tput sgr 0)"
read compile

if [ "$compile" != "n" ]; then
  echo ""
  echo "$(tput setaf 1)$(tput bold)COMPILING MACVIM$(tput sgr 0)"
  echo ""
  make
  open src/MacVim/build/Release/
else
  echo ""
  echo "$(tput setaf 1)$(tput bold)ABORTED!$(tput sgr 0)"
  echo ""
fi
