set nocompatible    " disable vi compatibility
filetype off

" Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Fugitive
Plugin 'tpope/vim-fugitive'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Command-T
Plugin 'wincent/Command-T'

" Code checking
Plugin 'scrooloose/syntastic'

" Vim
Plugin 'Lokaltog/vim-powerline'

" Julia
Plugin 'JuliaLang/julia-vim'

" R
Bundle 'Vim-R-plugin'
Bundle 'Screen-vim---gnu-screentmux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
"

let mapleader=','

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
set omnifunc=syntaxcomplete#Complete
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

let g:solarized_termtrans=1
set background=dark
colorscheme solarized

let g:Powerline_symbols='fancy'
" }}}

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
