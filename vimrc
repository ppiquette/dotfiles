
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" YC
filetype on   " required on MacOSX only
filetype off  " required!

set guifont=Monoid\ HalfLoose\ Regular:h12

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tomtom/tcomment_vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs' 
Bundle 'Mark--Karkat'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'elzr/vim-json'
Bundle "triglav/vim-visual-increment"
Bundle "yegappan/mru"
Bundle "tpope/vim-surround"
Bundle "xolox/vim-misc"
Bundle "xolox/vim-session"
" Bundle "majutsushi/tagbar"
Bundle "qpkorr/vim-renamer"

Bundle 'flazz/vim-colorschemes'
" Voir : http://cocopon.me/app/vim-color-gallery/

" Bundle 'bling/vim-airline'


let g:airline#extensions#tabline#enabled = 1

" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" " non-GitHub repos
"  Bundle 'git://git.wincent.com/command-t.git'
" " Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required



"""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
"map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yanick changes

set viminfo='100,f1,<500,:1000,s10,h,%,!
set virtualedit=block


" XML folding
" let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax


if has("gui_macvim")
  let macvim_hig_shift_movement = 1
"  colorscheme macvim
"  colorscheme desert
"  set bg=dark
  set ignorecase
  set autoread
endif

set tabstop=2
set shiftwidth=2
set expandtab

" re-indent all
map <F2> <Esc>gg=Ggg



set backupdir=~/temp,.
set directory=~/temp,.

set undofile                " Save undo's after file closes
set undodir=~/temp/vimundo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set cursorline    " highlight cursorline

" See http://vim.1045645.n5.nabble.com/VIM-Browser-for-DLL-and-JAR-td1166515.html
" Have the zip plugin treat a few other types as zip files.
au BufReadCmd *.dat, call zip#Browse(expand("<amatch>")) 




" BUNDLES settings
" Bundle 'elzr/vim-json'
" JSON syntax
" " Utliser javacript pour les json pcq c'est plus rapide a charger...
" au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0

" augroup json_autocmd 
"   autocmd! 
"   autocmd FileType json set autoindent 
"   autocmd FileType json set formatoptions=tcq2l 
"   autocmd FileType json set textwidth=78 shiftwidth=4 
"   autocmd FileType json set softtabstop=4 tabstop=4 
"   autocmd FileType json set expandtab 
"   autocmd FileType json set wrap
" augroup END 


" log4J syntax
augroup filetypedetect
" log files such as catalina.out or log4j files.
au! BufRead,BufNewFile catalina.out,*.out,*.out.*,*.log,*.log.* setf log
augroup END


" Tab completion in command line
set wildchar=<Tab> wildmenu wildmode=full

" minibufExpl plugin
" let g:miniBufExplMapCTabSwitchBufs = 1 
" map <Leader>b :MiniBufExplorer<cr>

" MRU on \e
map<Leader>e :MRU<cr>

" xolox/vim-session bundle plugin settings
let g:session_autosave='yes'
" let g:session_autosave_periodic=2
map<Leader>s :OpenSession!<cr>
map<Leader>S :SaveSession<cr>


" diff mode keyboard shortcuts
"     [cz. ==> [c moves to next diff, z. centers the current line on screen
noremap <C-up> [cz.
noremap <C-down> ]cz.


" allow editing crontab in /tmp/ folders on mac
set backupskip=/tmp/*,/private/tmp/*


" always have NERDTree open
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w

map<Leader>q :NERDTreeSteppedOpen<cr>
" map<Leader>q :NERDTreeTabsToggle<cr>
map<Leader>` :NERDTreeFind<cr>

set showbreak==>


" move lines
" from: 

nnoremap <C-down> :m .+1<CR>==
nnoremap <C-up> :m .-2<CR>==
inoremap <C-down> <Esc>:m .+1<CR>==gi
inoremap <C-up> <Esc>:m .-2<CR>==gi
vnoremap <C-down> :m '>+1<CR>gv=gv
vnoremap <C-up> :m '<-2<CR>gv=gv





inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


map <Leader>f :%!python -m json.tool<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adapted from vundle: "calon/Autosave"


if !has('python')
    echo "Error: Require Vim compiled with +python."
    finish
endif

" Set path and suffix for auto save file.
let s:auto_save_path = expand('~/temp/vimbackup')
let s:auto_save_suffix = ".txt"

" Check whether the path exists, create the directory when it doesn't exist.
if !isdirectory(s:auto_save_path)
    silent! call mkdir(s:auto_save_path, "p")
endif

" function! Autosave(path, suffix)
"
" python << monty
" import vim
" from datetime import datetime
" 
" path = vim.eval("s:auto_save_path")
" suffix = vim.eval("s:auto_save_suffix")
" cbuffer = vim.current.buffer                            # Get current buffer object.
" lines = cbuffer[0:len(cbuffer)]                         # Get current buffer's content.
" 
" if lines == [""] and len(cbuffer) == 1:                 # Check empty buffer.
"     name = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")    # Get current time stamp.
"     full_path_name = path + "/" + name + suffix         # Combined into full path and file name.
"     vim.command("silent edit %s" % (full_path_name))    # Edit this file.
"     vim.command("silent write")                         # And write to disk.
" 
" monty
" 
" endfunction
" 
" if has("autocmd") && len(expand('%:t')) == 0
"     autocmd BufEnter * call Autosave(s:auto_save_path, s:auto_save_suffix)
" endif

