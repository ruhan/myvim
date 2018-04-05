Myvim - A VIM editor for a Python Programmer
=====

This is my vim editor otimized for python code.

You need only to do it in your $HOME directory:

$ git clone https://github.com/ruhan/myvim.git .vim

$ cd .vim

$ git submodule init

$ git submodule update

$ ln -s $HOME/.vim/.vimrc $HOME/.vimrc


Configuration
=============

In your .bashrc:

$ export TERM="xterm-256color"

Install the font in your system:

$ cp "fonts/MyFontFile for Powerline.otf" ~/.fonts

$ fc-cache -vf ~/.fonts

Select the 'MyFontFile-for-Powerline.otf' default font for your terminal


That's it! Enjoy your new editor!

* For use the vim-powerline you will need a little more work, go to 
its repository and do your work.
