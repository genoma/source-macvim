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
echo "$(tput setaf 1) $(tput bold)There are 4 possible MacVim compile configuration: $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *1) Complete -> HOMEBREW Python/Ruby/Lua/Perl $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *2) Complete -> Yosemite Python/Ruby/Perl $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *3) Lua $(tput sgr 0)"
echo "$(tput setaf 1) $(tput bold) - *4) Minimal $(tput sgr 0)"
echo ""
echo -n "$(tput setaf 1)What version would you like to compile? $(tput bold)[1/$(tput setaf 4)2$(tput setaf 1)/3/4] $(tput sgr 0)"
read compile


echo ""
if [ "$compile" == "1" ]; then
  # Complete with homebrew lua/ruby/python
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --enable-rubyinterp\
              --enable-luainterp\
              --with-lua-prefix=/usr/local\
              --enable-pythoninterp\
              --disable-netbeans\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
elif [ "$compile" == "3" ]; then
  # minimal compilation with huge and Lua
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --enable-luainterp\
              --with-lua-prefix=/usr/local\
              --disable-netbeans\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
elif [ "$compile" == "4" ]; then
  # basic no linked dependencies
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --disable-netbeans\
              --with-compiledby=jenoma@gmail.com\
              --with-macarchs="x86_64"
else
  #  compilation whith just Vanilla Python and Ruby
  ./configure --enable-multibyte\
              --with-tlib=ncurses\
              --with-features=huge\
              --enable-rubyinterp\
              --enable-pythoninterp\
              --disable-netbeans\
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
