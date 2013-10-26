" vehrka dotvim
"
"
"
" --------------------------------------------------------
" For Network oriented work set nocompatible mode
"
set nocp

" --------------------------------------------------------
" Remapping the leader
"
let mapleader = ","
let g:mapleader = ","

" --------------------------------------------------------
" Automatically indent when adding a curly bracket, etc.
"
set smartindent
set autoindent

" --------------------------------------------------------
" This is the official Python convention
"
set shiftwidth=4
set tabstop=4
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
colorscheme desert
set background=dark

" --------------------------------------------------------
" Status line
"
set laststatus=2
set statusline=
set statusline+=%-3.3n\  " buffer number
set statusline+=%f\  " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=   " right align remainder
set statusline+=0x%-8B   " character value
set statusline+=%-14(%l,%c%V%)   " line, character
set statusline+=%<%P " file position
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
set whichwrap+=<,>,h,l

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

" --------------------------------------------------------
"  GUI options
"
if has("gui_running")
    " --------------------------------------------------------
    " Set font
    "
    set guifont=DejaVu\ Sans\ Mono\ 12
    " --------------------------------------------------------
    " Remove menu bar in gui
    "
    set guioptions-=m
    " --------------------------------------------------------
    "  Add tab pages
    "
    set guioptions+=e
    " --------------------------------------------------------
    "  set 256 colors
    "
    set t_Co=256
    " --------------------------------------------------------
    "  GUI tab label
    "
    set guitablabel=%M\ %t
endif

" --------------------------------------------------------
" Autocomands

" --------------------------------------------------------
" set text width only in text files
"
autocmd FileType text,rst setlocal textwidth=76 
au FileType text,rst setlocal textwidth=76 
au FileType text,rst setlocal cc=77 
au FileType python setlocal cc=80

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

"
" Pathogen
" -
filetype off
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"
" GundoToggle
"
map <leader>g :GundoToggle<CR>

"
" TaskList
"
map <leader>td <Plug>TaskList

"
" NERDTree
"   
map <S-F2> :NERDTreeToggle<cr>

"
" Tag List Toggle
" 
map <F3> :TlistToggle<cr>

"
" NERDCommenter 
" 
map <F4> \c<space><cr>

"
" Vim-Flake8
"
" vim-flake mapped by default to <F7> to change uncomment
" autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" 

" 
" SuperTab
"
" Tab Completition and Documentation
" use the SuperTab plugin to check the context of the code you are working on and choose the best for the situation
"
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

"
" Completition
"
" enable the menu and pydoc preview to get the most useful information
"
set completeopt=menuone,longest,preview

" 
" PyDoc
"
" We also enabled the pydoc plugin at the beginning with all the submodules; that gives us the ability to hit <leader>pw when our cursor is on a module and have a new window open with the whole documentation page for it.
"

" 
" Command-t
"
" To make finding and opening files within your project even easier, we are going to use the command-t plugin.
" command-t is bound to <leader>t
" searching only through opened buffers using <leader>b.
"

" 
" Ropevim
"  
" Refactoring and Go to definition
" Ropevim is also a great tool that will allow you to navigate around your code
"
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"
" Ack
"
" Searching
" Ack is similar to grep, but much better in my opinion. You can fuzzy text search for anything in your code (variable name, class, method, etc) and it'll give you a list of files and line numbers where they are defined
"
nmap <leader>a <Esc>:Ack!

"
" Git
"
" Integration with Git
" Git.vim will provide us syntax highlighting for git configuration files
" fugitive provides a great interface for interacting with git <-- Added to status line
"
" Gblame: This allows you to view a line by line comparison of who the last person to touch that line of code is.
" Gwrite: This will stage your file for commit, basically doing git add <filename>
" Gread: This will basically run a git checkout <filename>
" Gcommit: This will just run git commit. Since its in a vim buffer, you can use keyword completion (Ctrl-N), like test_all<Ctrl-N> to find the method name in your buffer and complete it for the commit message. You can also use + and - on the filenames in the message to stage/unstage them for the commit.


" --------------------------------------------------------
" Mapping
"

"
" WRAP HTML IN SELECTION
"
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
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

"
" space scroll in normal mode
"
noremap <space> <C-F>
noremap <S-space> <C-B>

"
" In visual mode C-r gets the selected text and ofers replace
"
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

"
" F5 to list buffers and choose one
"
:nnoremap <F5> :buffers<CR>:buffer<Space>

"
" To insert timestamp, press F6.
"
nmap <F6> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F6> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

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
" Mapserver sintax
"
let mysyntaxfile = "~/.vim/map.vim"

" --------------------------------------------------------
" MACROS
" ^M es un caracter especial para representar <CR> que se obtiene
" haciendo Ctrl+V y Ctrl+M.
"
let @a='gv$\wpWW'
let @b='\wbgvE\walli name=""i'
let @c='\walli href=".htm#"hhhhhi'
let @h='V\wh4llllvlldjhhhhP'
let @e='JJhhhhhvllllllldi'

" --------------------------------------------------------
" Syntax highlighting and Validation
"
syntax enable
filetype on
filetype plugin indent on
