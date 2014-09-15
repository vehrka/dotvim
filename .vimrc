" vehrka dotvim
"
"
"
" --------------------------------------------------------
" For Network oriented work set nocompatible mode
"
set nocp
filetype off

" --------------------------------------------------------
" Remapping the leader
"
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" --------------------------------------------------------
" Automatically indent when adding a curly bracket, etc.
"
set smartindent
set autoindent

" --------------------------------------------------------
" This is the official Python convention
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

" --------------------------------------------------------
" Minimal number of screen lines to keep above and below the cursor.
"
set scrolloff=10

" --------------------------------------------------------
" Use UTF-8.
"
set encoding=utf-8

" --------------------------------------------------------
" Set color scheme that I like.
"
set t_Co=256
colorscheme torte

" --------------------------------------------------------
" Status line
"
set laststatus=2
set statusline=
set statusline+=%-3.3n\  " buffer number
set statusline+=%f\  " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]\ " file type
set statusline+=%=   " right align remainder
set statusline+=%-4(l:%l\ c:%c%V\ w:%{WordCount()}%)\ " line, character
set statusline+=%<%P\ %L " file position
set statusline+=%{fugitive#statusline()}

" --------------------------------------------------------
" Show line number, cursor position.
"
set ruler

" --------------------------------------------------------
" Display incomplete commands.
"
set showcmd

" --------------------------------------------------------
" Show autocomplete menus.
"
set wildmenu
set wildignore=*.o,*~,*.pyc

" --------------------------------------------------------
" Show editing mode
"
set showmode

" --------------------------------------------------------
" Error bells are displayed visually.
"
set noerrorbells
set visualbell

" --------------------------------------------------------
" turn on line numbers
"
set number
set numberwidth=5

" --------------------------------------------------------
" expand history limit
"
set history=200

" --------------------------------------------------------
" Search
"
set incsearch
set ignorecase
set smartcase
set hlsearch

" --------------------------------------------------------
"  Show matching brackets
"
set showmatch
set mat=2 " tenths of a second to blink


" --------------------------------------------------------
" Turn on folding
"
set foldmethod=indent 
set foldlevel=100

" --------------------------------------------------------
" A buffer becomes hidden when it is abandoned
"
set hidden

" --------------------------------------------------------
" Backspace acts as it should act
"
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" --------------------------------------------------------
"  Remember info about open buffers on close
"
set viminfo^=%

" --------------------------------------------------------
" Directories
" Put backup and temporary files where they don't bother
"
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

"
" Completition: menu and pydoc enhanced
"
" enable the menu and pydoc preview to get the most useful information
"
set completeopt=menuone,longest,preview

" --------------------------------------------------------
"  GUI options
"
if has("gui_running")
    " --------------------------------------------------------
    " Set font
    "
    set guifont=DejaVu\ Sans\ Mono\ 12
    " --------------------------------------------------------
    " Remove Toobar in gui
    "
    set guioptions-=T
    " --------------------------------------------------------
    " Remove menu bar in gui
    "
    set guioptions-=m
    " --------------------------------------------------------
    "  Add tab pages
    "
    set guioptions+=e
    " --------------------------------------------------------
    "  GUI tab label
    "
    set guitablabel=%M\ %t
    colorscheme desert
endif

" --------------------------------------------------------
" Autocomands

" --------------------------------------------------------
" set text width only in text files
"
call matchadd('ColorColumn', '\%80v', 100)

" --------------------------------------------------------
" completition for htmldjango
"
"au FileType python set ft=python.django " For SnipMate
au FileType html set ft=htmldjango.html " For SnipMate

" --------------------------------------------------------
" completition for htmldjango
"
au FileType html set ft=html.snippets

" --------------------------------------------------------
" Return to last edit position when opening files (You want this!)
"
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" --------------------------------------------------------
" Plugins
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Rykka/riv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'fs111/pydoc.vim'
Plugin 'mileszs/ack.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Flake8-vim'
Plugin 'wincent/command-t'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" SuperTab: Tab Completition and Documentation
"
" use the SuperTab plugin to check the context of the code you are working on 
" and choose the best for the situation
"
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"


" 
" PyDoc: documentation pages for python
"
" We also enabled the pydoc plugin at the beginning with all the submodules; 
" that gives us the ability to hit 
"
" <leader>pw 
"
" when our cursor is on a module and have a new window open with the whole 
" documentation page for it.
"

"
" Commandt: improved searching in projectx
"
" To make finding and opening files within your project even easier, we are
" going to use the command-t plugin.  
" command-t is bound to 
"
" <leader>t
"
" searching only through opened buffers using 
"
" <leader>b 
"
" refresh available files with 
"
" <leader>y
map <leader>y :CommandTFlush<CR>

"
" Ack: Searching 
"
" Ack is similar to grep, but much better in my opinion. You
" can fuzzy text search for anything in your code (variable name, class,
" method, etc) and it'll give you a list of files and line numbers where they
" are defined
"
nmap <leader>a <Esc>:Ack!

"
" Git: Integration with Git Git.
"
" vim will provide us syntax highlighting for
" git configuration files fugitive provides a great interface for interacting
" with git <-- Added to status line
"
" Gblame : This allows you to view a line by line comparison of who the last
" person to touch that line of code is.  
"
" Gwrite : This will stage your file
" for commit, basically doing git add <filename> 
"
" Gread : This will basically
" run a git checkout <filename> 
"
" Gcommit : This will just run git commit. Since
" its in a vim buffer, you can use keyword completion (Ctrl-N), like
" test_all<Ctrl-N> to find the method name in your buffer and complete it for
" the commit message. You can also use + and - on the filenames in the message
" to stage/unstage them for the commit.

"
" List Transformation: convert a comma separated selection/paragraph into a list
"
nmap <leader>l :call ListTrans_toggle_format()<CR>
vmap <leader>l :call ListTrans_toggle_format('visual')<CR>

" 
" Vis: Extended visual Modes
" 
" Apply a command only to selected Block
"
" :B cmd
"
" Search only on selected Block
"
" :S 

"
" Dragvisuals: Block awesomeness
"
" Use cursor keys to move blocks arround
"
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')

" Use D to duplicate a block
vmap <expr> D DVB_Duplicate()

"
" VimFlake8: Flake8 for Vim
"
" vim-flake mapped by default to 
"
" <F7> 
"
" to change uncomment
"
" autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" 

" -------------------------------------------------------
"  FUNCTIONS
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" http://www.cromwell-intl.com/linux/vim-word-count.html
" " This combines several ideas from:
" " http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<>"
function WordCount()
    return g:word_count
endfunction
function UpdateWordCount()
    let lnum = 1
    let n =         0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    let g:word_count = n
endfunction
" Update        the count when cursor is idle in command or insert mode.
" " Update when idle for 1000 msec (default is 4000 msec).
 set updatetime=1000
 augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
 augroup END

function! VisualHTMLTagWrap()
  let tag = input("Tag to wrap block: ")
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i</".tag.">"
    else
      exe "normal a</".tag.">"
    endif
    normal `<
    exe "normal i<".tag.">"
    normal `<
  endif
endfunction

function! MyAutoIndent()
    set autoindent
    set smartindent
endfunction

function! MyNOAutoIndent()
    setl noai nocin nosi inde=
endfunction

" --------------------------------------------------------
" Mapping
"

"
" EASIER FORMATTING OF PARAGRAPHS
"
vmap Q gq
nmap Q gqap

" 
" Improved block moves
"
vnoremap < <gv
vnoremap > >gv

" --------------------------------------------------------
"  Copy and paste to system clipboard
"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>p "+p
vmap <Leader>p "+p
vmap <Leader>p "+p

" Autobatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Type 12<Enter> to go to line 12
" <Enter> go to end of file
" <BS> go to begining
nnoremap <CR> G
nnoremap <BS> gg

"
" WRAP HTML IN SELECTION
"
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>

"
" Autoindent mode
"
map <Leader>i <Esc>:call MyAutoIndent()<CR>
map <Leader>ni <Esc>:call MyNOAutoIndent()<CR>

"
" space scroll in normal mode
"
noremap <C-space> <C-F>
noremap <S-space> <C-B>

"
" In visual mode C-r gets the selected text and ofers replace
"
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" --------------------------------------------------------
" I never want regular Visual mode
"
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Enter line visual mode with double space
nmap <Leader><Leader> V

" Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x

" Make vaa select the entire file...
vmap aa VGo1G

" Window Splits Just a reminder
" Vertical Split : Ctrl+w + v
" Horizontal Split : Ctrl+w + s
" Close current windows : Ctrl+w + q

"
" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>:
"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"
" Added by Tim to map alt-left/right to flip through buffers
"
nmap <A-h> :bp<CR>
nmap <A-l> :bn<CR>

"
" move between tabs
"
noremap <A-j> gT
noremap <A-k> gt

" --------------------------------------------------------
"  Disable highlight when <leader><cr> is presed
"
map <silent> <leader><cr> :noh<cr>

" --------------------------------------------------------
" Switch CWD to the directory of the open buffer
"
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" --------------------------------------------------------
"  Sudo tee trick
"
map <leader>ws :w !sudo tee%<cr>

" --------------------------------------------------------
" No more :w
"
map <c-s> :w<cr>


"
" How many times
"
nmap <leader>s :%s///g<LEFT><LEFT><LEFT>
vmap <leader>s :s///g<LEFT><LEFT><LEFT>

" --------------------------------------------------------
"  Local vimrc
"
map <leader>lv :source .lvimrc<cr>

" --------------------------------------------------------
" Edit vimrc
"
map <leader>vrc :e ~/.vimrc<cr>

" --------------------------------------------------------
"  Function Keys Mappings
"
" NERDTree
"   
map <F2> :NERDTreeToggle<cr>

"
" NERDCommenter 
" 
map <F4> <leader>c<space><cr>

"
" F5 to list buffers and choose one
"
:nnoremap <F5> :buffers<CR>:buffer<Space>

"
" To insert timestamp, press F6.
"
nmap <F6> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F6> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

"
" Word count
"
map <F8> g<C-g>


" --------------------------------------------------------
" MACROS
" ^M es un caracter especial para representar <CR> que se obtiene
" haciendo Ctrl+V y Ctrl+M.
"
let @a='gv$,wpWW'
let @b=',wbgvE,walli name=""i'
let @c=',walli href=".htm#"hhhhhi'
let @h='V,wh4llllvlldjhhhhP'
let @e='JJhhhhhvllllllldi'

" --------------------------------------------------------
" Syntax highlighting and Validation
"
syntax enable
filetype on
filetype plugin indent on

" syntax in diff
augroup PatchDiffHighlight
    autocmd!
    autocmd FileType diff syntax enable
augroup END

" --------------------------------------------------------
"  Shady Characters
"
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list

" --------------------------------------------------------
" Mapserver syntax
"
let mysyntaxfile = "~/.vim/map.vim"

" --------------------------------------------------------
"  References
"  http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

