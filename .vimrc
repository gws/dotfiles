call pathogen#infect()
call pathogen#helptags()

" sane default language encoding
set encoding=utf-8

" make edited files utf-8
set fileencoding=utf-8

" i don't want your code executing things in my editor
set nomodeline

" avoid hanging on long lines
set synmaxcol=420

" enable filetype plugins
filetype plugin indent on

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
" no line numbering
set nonumber
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
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set textwidth=80
set formatoptions=roql

colorscheme Tomorrow-Night

augroup gws
    au FileType clojure RainbowParenthesesActivate
    au FileType clojure RainbowParenthesesLoadRound
    au FileType clojure RainbowParenthesesLoadSquare
    au FileType clojure RainbowParenthesesLoadBraces
    au FileType clojure setl lisp

    au BufRead *.phtml setl shiftwidth=2 softtabstop=2
    au BufRead *.ptxt setl filetype=php shiftwidth=2 softtabstop=2

    au FileType perl,php,python setl shiftwidth=4 softtabstop=4

    au FileType c,cpp setl noexpandtab shiftwidth=8 tabstop=8

    au FileType haskell setl shiftwidth=4 softtabstop=4 tabstop=8
    au FileType haskell setl nojoinspaces

    au FileType haskell compiler ghc

    let g:haddock_browser="/usr/bin/x-www-browser"
augroup END

" Key mappings

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" rebind from \ to , as it is a little more standard
let g:mapleader = ','
let g:maplocalleader = ','

" easier command entry
nnoremap ; :

" clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" if you forget to sudo - really write the file
cmap w!! w !sudo tee % >/dev/null

" Plugin: NerdTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Plugin: rainbow_parentheses.vim
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]
let g:rbpt_max = len(g:rbpt_colorpairs)

" Temporary files
if !isdirectory(expand('~/.cache/vim/undo'))
    call mkdir(expand('~/.cache/vim/undo'), 'p', 0700)
endif
if isdirectory(expand('~/.cache/vim'))
    set directory=~/.cache/vim
    set viminfo+=n~/.cache/vim/viminfo
    let g:netrw_home = expand('~/.cache/vim')
endif
if has('persistent_undo') && isdirectory(expand('~/.cache/vim/undo'))
    set undofile
    set undodir=~/.cache/vim/undo
endif

if has('gui_running')
    set guioptions=c
else
    set ttyfast
    set t_Co=256
endif

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
