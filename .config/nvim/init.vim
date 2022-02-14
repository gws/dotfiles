" make edited files utf-8
set fileencoding=utf-8

" files should not execute things in my editor
set nomodeline

" avoid hanging on long lines
set synmaxcol=420

" ensure dialog when :q, :w, :wq fail
set confirm
" abbreviate messages
set shortmess+=filmnrxoOtT
" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash
" allow for cursor beyond last character
set virtualedit=onemore
" allow buffer switching without saving
set hidden

" no spacing between rows
set linespace=0
" line numbering
set number
" highlight search terms
set hlsearch
set winminheight=0
" case insensitive search
set ignorecase
" case sensitive sometimes
set smartcase
" default on /g modifier for substitution
set gdefault
set wildignore=.*.*~,.*.sw?,.swp,*.hi,*.o
" matches longest, then full
set wildmode=list:longest,full
" what bs and cursor keys wrap to
set whichwrap=b,s,h,l,<,>,[,]
" auto-fold code
set foldenable
set fillchars=

" problematic whitespace
set list

" indentation and tabbing defaults
set nowrap
set linebreak
set showbreak=…
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
set textwidth=80
set formatoptions-=t

let g:netrw_browse_split=3
let g:netrw_winsize=30

set grepprg=rg\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" clojure formatting
let g:clojure_align_subforms=1
let g:clojure_fuzzy_indent=1
let g:clojure_fuzzy_indent_patterns=['^with', '^def', '^let', '^try']
let g:clojure_syntax_keywords={
  \ 'clojureMacro': ['defproject', 'deftask'],
  \ }

if has('gui_running')
  set guioptions=c
else
  set ttyfast
  set t_Co=256
endif

"""
""" Plugins
"""
""" vim-plug
""" https://github.com/junegunn/vim-plug

call plug#begin(stdpath('data') . '/plugged')

" https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'

" https://github.com/lifepillar/vim-solarized8
Plug 'lifepillar/vim-solarized8'

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/tpope/vim-fireplace
Plug 'tpope/vim-fireplace'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/guns/vim-sexp
Plug 'guns/vim-sexp'

" https://github.com/tpope/vim-sexp-mappings-for-regular-people
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" https://github.com/chrisbra/csv.vim
Plug 'chrisbra/csv.vim'

call plug#end()

"""
""" Color scheme
"""

set background=dark
colorscheme solarized8_high

function! Figgieback()
  execute "Piggieback (do (require '[figwheel-sidecar.repl-api]) (figwheel-sidecar.repl-api/repl-env))"
endfunction

augroup gws
    au BufRead,BufNewFile *.phtml,*.ptxt setl filetype=php

    au BufRead,BufNewFile Vagrantfile setl filetype=ruby

    au FileType gitconfig setl noexpandtab shiftwidth=2 tabstop=2 softtabstop=2

    au FileType perl,php,python setl shiftwidth=4 tabstop=4 softtabstop=4

    au FileType c,cpp,go setl noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

    au FileType clojure command! Figgieback :execute Figgieback()

    au FileType haskell setl shiftwidth=4 tabstop=4 softtabstop=4 shiftround
augroup END

"""
""" Key mappings
"""

" rebind from \ to , as it is a little more standard
let g:mapleader=','
let g:maplocalleader=','

" easier command entry
map ; :
noremap ;; ;

" clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" if you forget to sudo - really write the file
cmap w!! w !sudo tee % >/dev/null

" base64-decode a visual selection
vnoremap <leader>64d y:echo system('base64 -d', @")<CR>
" base64-encode a visual selection
vnoremap <leader>64e y:echo system('base64', @")<CR>

" vim-fireplace (Clojure-specific)
map <leader>cr :Require<CR>
map <leader>cra :Require!<CR>
map <leader>ct :RunTests<CR>
map <leader>cta :RunAllTests<CR>
map <leader>ctc :.RunTests<CR>

" ghcmod-vim (Haskell-specific)
map <leader>htw :GhcModTypeInsert<CR>
map <leader>hts :GhcModSplitFunCase<CR>
map <leader>htq :GhcModType<CR>
map <leader>hte :GhcModTypeClear<CR>

" Netrw
nnoremap <C-e> :Lexplore<CR>
