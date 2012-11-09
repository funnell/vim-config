set nocompatible    " disable vi compatibility
let mapleader=','

filetype off
set history=256     " number of things to remember in history

set backspace=indent,eol,start  " allow better backspace

" Match and search
set hlsearch        " highlight search
set ignorecase      " case insensitive search
set smartcase       " be sensitive when there's a capital letter
set incsearch

" Formatting {{{
set tabstop=4       " default tab stop
set softtabstop=4
set shiftwidth=4    " default shift width for indents
set expandtab       " convert tabs to spaces
set smarttab        " smarter tab levels

set autoindent
set smartindent

syntax on                   " enable syntax highlighting
filetype plugin indent on   " automatically detect filetypes
" }}}

" Code completion
au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType="context"

" Visual {{{
set nonumber        " line numbers off
set showmatch       " show matching brackets
set matchtime=5     " bracket blinking
set novisualbell    " no visual bell (blinking)
set noerrorbells    " no audio bell
set laststatus=2    " always show status line
set vb t_vb=        " disable bell on error

set nolist          " display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " unprintable chars mapping

set foldenable          " turn on folding
set foldmethod=marker   " fold on the marker
set foldlevel=100       " don't autofold anything (can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

set mouse-=a   " disable mouse
set mousehide  " hide mouse after chars typed

set splitbelow
set splitright
" }}}


" Plugins {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Solarized theme
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
set background=dark
colorscheme solarized


" Fugitive
Bundle 'tpope/vim-fugitive'

" NERDCommenter
Bundle 'scrooloose/nerdcommenter'

" Command-T
Bundle 'wincent/Command-T'

" Python code
Bundle 'scrooloose/syntastic'

" Vim
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'

" R
Bundle 'Vim-R-plugin'
Bundle 'Screen-vim---gnu-screentmux'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" }}}
"

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
