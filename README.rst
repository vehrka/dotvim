================
Vehrka's dotvim
================

Renewed dotvim experience using vim.spf13 distribution

http://vim.spf13.com/

:Version: 1.2

Easy install
============

.. code:: bash

    curl http://j.mp/spf13-vim3 -L -o - | sh


Updating to the latest version
------------------------------

.. code:: bash

    cd $HOME/to/spf13-vim/
    git pull
    vim +BundleInstall! +BundleClean +q


Customization
-------------

Create symbolic links to the *.vimrc.local* and *.vimrc.before.local* and *.vimrc.bundles.local* in your $HOME.

Changelog
=========

:v1.1: MBA version file
:v1.2: minor tweaks for Omnium
:v1: Added pre-spf13
:v0: Version pre-spf13
