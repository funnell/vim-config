filetype on
filetype plugin on
filetype indent on

syntax on

set autoindent
set smartindent
set nu
set nocompatible
set tabstop=4
set shiftwidth=4
set noexpandtab
set guioptions-=T
set nohlsearch
set incsearch
set showmatch
set history=100

" change directory to the current buffer's file's directory
autocmd BufEnter * lcd %:p:h
" get rid of the annoying bell
autocmd VimEnter * set vb t_vb=
" set html files to php filetype to allow php syntax highlighting, etc.
autocmd BufNewFile,BufRead *.html set filetype=php

" use closetag script for html, xml, xsl, php files
autocmd Filetype html,xml,xsl,php source ~/.vim/scripts/closetag.vim
" use the sparkup plugin for xml, xsl, php files
autocmd Filetype xml,xsl,php source ~/.vim/ftplugin/html/sparkup.vim
" highlights interpolated variables in sql strings and does sql-syntax highlighting
"autocmd FileType php let php_sql_query=0
" highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" discourages use of short tags
autocmd FileType php let php_noShortTags=1
" automagically folds functions & methods
autocmd FileType php let php_folding=1
" set the compiler for php files
autocmd FileType php try | execute "compiler php" | catch /./ | endtry

" add a keyword for tex files so that <C-n> will cycle through figure labels
autocmd FileType tex set iskeyword+=:

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" set 256 colour mode for molokai to work in the terminal
set t_Co=256
colorscheme wombat
" sets the molokai background to a dark grey
let g:molokai_original=0

" .tex files should be treated as latex files
let g:tex_flavor='latex'
" generate pdfs from latex
let g:Tex_DefaultTargetFormat='pdf'
" set the pdf viewer
let g:Tex_ViewRule_pdf='evince'

function! InsertCloseTag()
  if &filetype == 'html'

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

    " remember current position:
    normal mz

    " loop backwards looking for tags:
    let Found = 0
    while Found == 0
      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z
    if col('.') == 1
      normal "zP
    else
      normal "zp
    endif

  else " filetype is not HTML
    echohl ErrorMsg
    echo 'The InsertCloseTag() function is only intended to be used in HTML ' .
      \ 'files.'
    sleep
    echohl None

  endif " check on filetype

endfunction " InsertCloseTag()

