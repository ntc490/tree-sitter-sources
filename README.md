# Tree-sitter for Emacs

## Purpose

Source code for my emacs setup. This currently targets emacs
29.3. It's a container to control versions and make setup easier for
current generation of emacs. This can probably go away when emacs
tree-sitter integration matures.

Add this as a submodule to .emacs.d and do a recursive clone if you
wish.

## Commands

The following command will build all modules and install them to
~/.emacs.d/tree-sitter by default:

    make install

List all the modules:

    make list

Simply build all the modules:

    make

OR

    make all

Change the default install location:

    make DESTDIR=test install

Maybe you don't want the full list of modules?:

    make MODULES="tree-sitter-c tree-sitter-cpp" list
