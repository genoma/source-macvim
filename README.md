Source Vim
==========

If you want to compile MacVim from source, because you, like me, want the latest developement version and you are using **Homebrew** to keep your development environment up to date, you should know that the _brewed_ Python version doesn't links to Vim with `--enable-pythoninterp`, nor does the _Macports_ version.

The solution is to **patch** the `src/auto/configure` with the correct path:

`-F/usr/local/Cellar/python/2.7.6/Frameworks -framework Python`

## Script

The `./compile-vim.sh` is a simple script that can be used to automate the Vim source compilation, it keeps your `~/vim` source `hg` repo up to date, it patches the `configure` script and it compiles and install vim in `/usr/local/bin`.

## Script option

The script interactively present you a few options:

- Update MacVim source files
- Apply patch for Homebrew Python 2.7.X
- Configure Vim with 3 possible configurations:
	- Complete -> Python/Ruby/Lua/Perl support
	- Essential -> Python support only
	- Minimal -> basically the default configuration with only VimL support

## License

The MIT License (MIT)

Copyright (c) 2014 Alessandro Vioni

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
