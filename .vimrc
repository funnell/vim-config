set nocompatible    " disable vi compatibility
filetype off

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Fugitive
Plugin 'tpope/vim-fugitive'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {'snakemake': {'left': '#'}}

" Command-T
Plugin 'wincent/Command-T'

" Python code
Plugin 'scrooloose/syntastic'

" Vim
Plugin 'itchyny/lightline.vim'
let g:lightline = {'colorscheme': 'Tomorrow_Night'}

" Tomorrow Theme
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" R
Plugin 'Vim-R-plugin'
Plugin 'Screen-vim---gnu-screentmux'

" Julia
Plugin 'funnell/julia-vim'
Plugin 'benekastah/neomake'
Plugin 'zyedidia/julialint.vim'

" Snakemake
Plugin 'https://bitbucket.org/snakemake/snakemake.git', {'rtp': 'misc/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

let mapleader=','

set history=256     " number of things to remember in history

set backspace=indent,eol,start  " allow better backspace

set shell=bash

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

" Snakefile
au BufNewFile,BufRead Snakefile set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake filetype=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake filetype=snakemake

" Visual {{{
set nonumber        " line numbers off
set showmatch       " show matching brackets
set matchtime=5     " bracket blinking
set novisualbell    " no visual bell (blinking)
set noerrorbells    " no audio bell
set laststatus=2    " always show status line
set noshowmode      " don't show mode
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


" Colour scheme
syntax enable
set t_Co=256        " use 256 colour mode
color Tomorrow-Night
" }}}

" Syntastic
let g:syntastic_python_checkers = ['flake8']
