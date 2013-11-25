##############################
Configuración de Vim de Vehrka
##############################

Introducción
==================

Esto es solo mi configuración de VIM, puede que te parezca interesante, puede que no ... pero es lo que hay.

Instalación
=================

Obiamente hacer un git clone indicando como directorio de salida ~/.vim

Hay que hacer un enlace simbólico de ~/.vim/.vimrc en ~/

Y para que se descargue los plugins hay que ejecutar

.. code-block:: bash

    git submodule update --init

Además hay que tener intalados los siguientes paquetes


.. code-block:: bash

    sudo apt-get install exuberant-ctags ack-grep

También hay que instalar


.. code-block:: bash

    sudo pip install flake8

Y crear el alias de ack en .bash_aliases


.. code-block:: bash

    alias ack='ack-grep'

Antes de usar el plugin command-t hay que compilarlo


.. code-block:: bash

    cd ~/.vim/bundle/command-t
    rake make

También se recomienda compilar la documentación


.. code-block:: bash

    cd ~/.vim/doc
    vim
    :helptags .

Y salir de vim

Añadiendo cosas
=====================

Para añadir nuevos plugins


.. code-block:: bash

    git submodule add https://direccion.git bundle/nombreplugin

Cheat Sheet
=================

Movement
----------------

+ Space/S-Space -> Page Adv/Page Back
+ gT/gt -> Move between Tabs
+ A-h/l -> Move between Buffers
+ C-j/k/l/h -> Move between windows

Search
--------------

+ / -> Incremental search case insensitive
+ ,b -> Search on open buffers
+ ,t -> Search on current directory files
+ ,a -> Search using ack
+ ,<cr> -> Disable highlight

Gundo Toggle 
-------------

+ ,g -> Open/Close Undo Window

Task list 
----------

+ ,td -> Open/Close TODO/FIXME window

File Explorer 
--------------

+ F2 -> Open/Close file explorer window
+ ,cd -> CWD to current file directory

Tag list 
---------

+ F3 -> Open/Close tag list window

Comments 
---------

+ F4 -> Comment/Uncomment current line

Buffer Explorer 
----------------

+ F5 -> Open buffer selection

Time stamp 
-----------

+ F6 -> Insert timestamp

Tab completion 
---------------

Use <Tab> to get a list of possible completion words

Git 
----

+ :Gblame -> line by line comparision
+ :Gwrite -> git add currentfile
+ :Gread -> git checkout currentfile
+ :Gcommit -> git commit

Web 
----

+ ,w -> on a visual selection asks for tag to wrap

Sudo trick
----------

+ ,ws -> Does the sudo trick

Activation deactivation of autoindenting
----------------------------------------

+ ,i -> autoindent and smartindent
+ ,ni -> no indenting

Python related 
---------------

Python syntax check 
~~~~~~~~~~~~~~~~~~~~

+ F7 -> Check current Python file syntax

Python Documentation 
~~~~~~~~~~~~~~~~~~~~~

+ ,pw -> When cursor is on a module, displays documentation

Goto Definition 
~~~~~~~~~~~~~~~~

+ ,j -> Goto cursor position definition

Rename 
~~~~~~~

+ ,r -> Rename function/variable/class/whatever in a project


reStructuredText in Vim a.k.a. Riv 
-----------------------------------

Commands
--------

+ **View**

  - _`:RivFoldToggle` : Toggle Fold

    **Normal** :	<C-E><Space><Space>

  - _`:RivFoldAll` : Toggle all folding

    **Normal** :	<C-E><Space>a

  - _`:RivFoldUpdate` : Update Folding

    **Normal** :	<C-E><Space>u

  - _`:RivLinkOpen` : Open Link under Cursor

    **Normal** :	<C-E>ko

  - _`:RivLinkNext` : Jump to Next Link

    **Normal** :	<C-E>kn,<TAB>

  - _`:RivLinkPrev` : Jump to Prev Linx

    **Normal** :	<C-E>kp,<S-TAB>

+ **Doc**

  - _`:RivTitle0` : Create Type 0 Title

    **Normal,Insert** :	<C-E>s0

  - _`:RivTitle6` : Create Type 6 Title

    **Normal,Insert** :	<C-E>s6


  - _`:RivTableCreate` : Create a Table

    **Normal,Insert** :	<C-E>tc

  - _`:RivTableFormat` : Format table

    **Normal,Insert** :	<C-E>tf

  - _`:RivTableNextCell` : Nav to Next Cell

    **Normal,Insert** :	<C-E>tn

  - _`:RivTablePrevCell` : Nav to Prev Cell

    **Normal,Insert** :	<C-E>tp

  - _`:RivListNew` : Create a New List

    **Normal,Insert** :	<C-E>ln

  - _`:RivListSub` : Create a sub list item

    **Normal,Insert** :	<C-E>lb

  - _`:RivListSup` : Create a sup list item

    **Normal,Insert** :	<C-E>lp

  - _`:RivListToggle` : ToggleList item

    **Normal,Insert** :	<C-E>l`

  - _`:RivListDelete` : Delete List item

    **Normal,Insert** :	<C-E>lx

  - _`:RivListType0` : Create a List type 0

    **Normal,Insert** :	<C-E>l1

  - _`:RivListType4` : Create a List type 4

    **Normal,Insert** :	<C-E>l5

  - _`:RivTodoToggle` : Toggle Todo item's status

    **Normal,Insert** :	<C-E>ee

  - _`:RivTodoDel` : Del Todo Item

    **Normal,Insert** :	<C-E>ex

  - _`:RivTodoDate` : Change Date stamp under cursor

    **Normal,Insert** :	<C-E>ed

  - _`:RivTodoPrior` : Change Todo Priorties

    **Normal,Insert** :	<C-E>ep

  - _`:RivTodoAsk` : Show the todo group list

    **Normal,Insert** :	<C-E>e`

  - _`:RivTodoType1` : Change to group 1

    **Normal,Insert** :	<C-E>e1


  - _`:RivTodoType4` : Change to group 4

    **Normal,Insert** :	<C-E>e4

  - _`:RivTodoUpdateCache` : Update Todo cache

    **Normal** :	<C-E>uc

+ **Edit**

  - _`:RivCreateLink` : Create Link based on current word

    **Normal,Insert** :	<C-E>ck

  - _`:RivCreateFoot` : Create Footnote

    **Normal,Insert** :	<C-E>cf

  - _`:RivCreateDate` : Insert Current Date

    **Normal,Insert** :	<C-E>cdd

  - _`:RivCreateTime` : Insert Current time

    **Normal,Insert** :	<C-E>cdt

  - _`:RivCreateContent` : Insert Content Table

    **Normal** :	<C-E>cc

  - _`:RivCreateEmphasis` : Emphasis

    **Normal,Insert** :	<C-E>ce

  - _`:RivCreateStrong` : Strong

    **Normal,Insert** :	<C-E>cs

  - _`:RivCreateInterpreted` : Interpreted

    **Normal,Insert** :	<C-E>ci

  - _`:RivCreateLiteralInline` : LiteralInline

    **Normal,Insert** :	<C-E>cl

  - _`:RivCreateLiteralBlock` : LiteralBlock

    **Normal,Insert** :	<C-E>cb

  - _`:RivCreateHyperLink` : HyperLink

    **Normal,Insert** :	<C-E>ch

  - _`:RivCreateTransition` : Transition

    **Normal,Insert** :	<C-E>cr

  - _`:RivCreateExplicitMark` : ExplicitMark

    **Normal,Insert** :	<C-E>cm

  - _`:RivDeleteFile` : Delete Current File

    **Normal** :	<C-E>df

+ **Miscs**

  - _`:Riv2HtmlFile` : Convert to html

    **Normal** :	<C-E>2hf

  - _`:Riv2HtmlAndBrowse` : Convert to html and browse current file

    **Normal** :	<C-E>2hh

  - _`:Riv2HtmlProject` : Convert project to html

    **Normal** :	<C-E>2hp

  - _`:Riv2Odt` : Convert to odt

    **Normal** :	<C-E>2oo

  - _`:Riv2S5` : Convert to S5

    **Normal** :	<C-E>2ss


  - _`:Riv2Latex` : Convert to Latex

    **Normal** :	<C-E>2ll

  - _`:Riv2Pdf` : Convert to Pdf

    **Normal** :	<C-E>2pp

  - _`:Riv2BuildPath` : Show Build Path of the project

    **Normal** :	<C-E>2b

  - _`:RivTestReload` : Force reload Riv and Current Document

    **Normal** :	<C-E>t`

  - _`:RivHelpTodo` : Show Todo Helper

    **Normal** :	<C-E>ht,<C-E><C-h><C-t>

  - _`:RivHelpFile` : Show File Helper

    **Normal** :	<C-E>hf,<C-E><C-h><C-f>

  - _`:RivHelpSection` : Show Section Helper

    **Normal** :	<C-E>hs

  - _`:RivInstruction` : Show Riv Instrucion

  - _`:RivQuickStart` : Show Riv QuickStart

  - _`:RivPrimer` : Show RST Primer

  - _`:RivCheatSheet` : Show RST CheatSheet

  - _`:RivSpecification` : Show RST Specification

Other 
------

+ C-r -> on visual selection gets the text and offers replace

Instalación desde 0 
====================

Los plugins se instalan con Pathogen


.. code-block:: bash

    mkdir -p ~/.vim/{autoload,bundle}
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/

El plugin TaglistToggle hay que instalarlo desde sourceforge


.. code-block:: bash

    wget -O taglist_45.zip http://downloads.sourceforge.net/project/vim-taglist/vim-taglist/4.5/taglist_45.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fvim-taglist%2Ffiles%2Fvim-taglist%2F4.5%2F&ts=1359704803&use_mirror=heanet
    unzip taglist_45.zip -d ~/.vim

Una vez lo tengamos todo a nuestro gusto hay que inicializar git


.. code-block:: bash

    cd ~/.vim/
    git init

Para añadir los plugins que están en github


.. code-block:: bash

    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
    git submodule add https://github.com/tpope/vim-surround.git bundle/surround
    git submodule add https://github.com/tpope/vim-git.git bundle/git
    git submodule add https://github.com/ervandew/supertab.git bundle/supertab
    git submodule add https://github.com/sontek/minibufexpl.vim.git bundle/minibufexpl
    git submodule add https://github.com/wincent/Command-T.git bundle/command-t
    git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
    git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
    git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
    git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
    git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
    git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
    git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
    git submodule add https://github.com/sontek/rope-vim.git bundle/ropevim
    git submodule add https://github.com/nvie/vim-flake8.git bundle/vim-flake8
    git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

Después habrá que añadir los archivos que no están aún versionados:


.. code-block:: bash

    git add .vimrc LICENSE.md README.md autoload/ doc/ map.vim plugin/ snippets/ spell/

Hacer commit


.. code-block:: bash

    git commit -a

Y para subirlo a nuestro propio repositorio


.. code-block:: bash

    git push https://github.com/user/repo.git

Referencias
===========

+ http://charlietanks.net/philtex/my-vimrc-file/
+ https://github.com/tpope/vim-pathogen
+ http://www.vim.org/scripts/script.php?script_id=1658
+ http://vim-taglist.sourceforge.net
+ http://www.vim.org/scripts/script.php?script_id=1218
+ http://vim.wikia.com/wiki/Wrap_a_visual_selection_in_an_HTML_tag
+ http://vim.wikia.com/wiki/Macros#Saving_a_macro
+ http://www.sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
+ http://tompurl.com/2012/11/22/writing-a-book-with-vim/
+ http://amix.dk/vim/vimrc.html
