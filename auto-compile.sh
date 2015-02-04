#!/bin/bash

# Basic
cd ~/source-macvim
echo "n
4
y" | ./compile-macvim.sh
cd ~/macvim/src/MacVim/build/Release/
tar -cvzf MacVim-Basic.tar.gz MacVim.app


# Complete with Yosemite Python, Ruby
brew unlink ruby
cd ~/source-macvim
echo "n
2
y" | ./compile-macvim.sh
cd ~/macvim/src/MacVim/build/Release/
tar -cvzf MacVim-Yosemite-Python-Ruby.tar.gz MacVim.app

# Complete with Homebrew Python, Ruby, Lua
brew link ruby
cd ~/source-macvim
echo "y
1
y" | ./compile-macvim.sh
cd ~/macvim/src/MacVim/build/Release/
tar -cvzf MacVim-Homebrew-Python-Ruby-Lua-Latest.tar.gz MacVim.app
