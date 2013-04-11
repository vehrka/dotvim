# Configuración de Vim de vehrka  #

    "These are not the robots you are looking for"

## Introducción ##

En serio, esto es solo mi configuración de VIM, puede que te parezca interesante, puede que no ... pero es lo que hay.

## Instalación ##

Obiamente hacer un git clone indicando como directorio de salida ~/.vim

Hay que hacer un enlace simbólico de ~/.vim/.vimrc en ~/

Y para que se descargue los plugins hay que ejecutar

    $ git submodule update --init

Además hay que tener intalados los siguientes paquetes

    # apt-get install exuberant-ctags ack-grep

También hay que instalar

    # pip install flake8

Y crear el alias de ack en .bash_aliases

    alias ack='ack-grep'

Antes de usar el plugin command-t hay que compilarlo

    $ cd ~/.vim/bundle/command-t
    $ rake make

También se recomienda compilar la documentación

    $ cd ~/.vim/doc
    $ vim
    $ :helptags .

Y salir de vim

## Añadiendo cosas ##

Para añadir nuevos plugins

    $ git submodule add https://direccion.git bundle/nombreplugin

## Cheat Sheet ##

### Movement ###

+ Space/S-Space -> Page Adv/Page Back
+ gT/gt -> Move between Tabs
+ A-h/l -> Move between Buffers
+ C-j/k/l/h -> Move between windows

### Search ###

+ / -> Incremental search case insensitive
+ \b -> Search on open buffers
+ \t -> Search on current directory files
+ \a -> Search using ack

### Folding ###

+ za -> Toggle open/close current fold
+ zR -> Open all folds
+ zE -> Close all folds

### Gundo Toggle ###

+ \g -> Open/Close Undo Window

### Task list ###

+ \td -> Open/Close TODO/FIXME window

### File Explorer ###

+ F2 -> Open/Close file explorer window

### Tag list ###

+ F3 -> Open/Close tag list window

### Comments ###

+ F4 -> Comment/Uncomment current line

### Buffer Explorer ####

+ F5 -> Open buffer selection

### Time stamp ###

+ F6 -> Insert timestamp

### Tab completion ###

Use <Tab> to get a list of possible completion words

### Git ###

+ :Gblame -> line by line comparision
+ :Gwrite -> git add currentfile
+ :Gread -> git checkout currentfile
+ :Gcommit -> git commit

### Web ###

+ \w -> on a visual selection asks for tag to wrap

### Python related ###

#### Python syntax check ####

+ F7 -> Check current Python file syntax

#### Python Documentation ####

+ \pw -> When cursor is on a module, displays documentation

#### Goto Definition ####

+ \j -> Goto cursor position definition

#### Rename ####

+ \r -> Rename function/variable/class/whatever in a project

### Other ###

+ C-s -> Saves the file
+ C-r -> on visual selection gets the text and offers replace

## Instalación desde 0 ##

Los plugins se instalan con Pathogen

    $ mkdir -p ~/.vim/{autoload,bundle}
    $ curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/

El plugin TaglistToggle hay que instalarlo desde sourceforge

    $ wget -O taglist_45.zip http://downloads.sourceforge.net/project/vim-taglist/vim-taglist/4.5/taglist_45.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fvim-taglist%2Ffiles%2Fvim-taglist%2F4.5%2F&ts=1359704803&use_mirror=heanet
    $ unzip taglist_45.zip -d ~/.vim

Una vez lo tengamos todo a nuestro gusto hay que inicializar git

    $ cd ~/.vim/
    $ git init

Para añadir los plugins que están en github

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

    $ git add .vimrc LICENSE.md README.md autoload/ doc/ map.vim plugin/ snippets/ spell/

Hacer commit

    $ git commit -a

Y para subirlo a nuestro propio repositorio

    $ git push https://github.com/user/repo.git

## Referencias ##

+ http://charlietanks.net/philtex/my-vimrc-file/
+ https://github.com/tpope/vim-pathogen
+ http://www.vim.org/scripts/script.php?script_id=1658
+ http://vim-taglist.sourceforge.net
+ http://www.vim.org/scripts/script.php?script_id=1218
+ http://vim.wikia.com/wiki/Wrap_a_visual_selection_in_an_HTML_tag
+ http://vim.wikia.com/wiki/Macros#Saving_a_macro
+ http://www.sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
