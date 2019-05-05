" Plugins
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'wincent/command-t'
call plug#end()

" change leader to ,
let mapleader=','
"turn off vi compatibility
set nocompatible
"don't make swap files
set noswapfile
"various settings to modify the way searching works
set path+=**
set wildmenu
set hlsearch
set ignorecase
set smartcase
set incsearch
"various ui changes
syntax on
set number
set showcmd
set ruler
set cursorline
set wrap
set textwidth=0
set wrapmargin=0
set foldmethod=indent
set foldlevel=99
"colors
colorscheme vim-monokai-tasty
highlight SpecialKey ctermbg=235
"show whitespace
set list lcs=space:·,tab:>-
"use monokai lightline theme
let g:lightline = { 'colorscheme': 'monokai_tasty' }
"makes lightline work in single window
set laststatus=2
"set nerdtree toggle to control o
map <silent> <Leader>o :NERDTreeToggle<CR>
"bracket matching
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>
"python indentation
au BufNewFile,BufRead *.py
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
"indentation for javascript, html, and css
au BufNewFile,BufRead *.js,*.html,*.css
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set expandtab
    set autoindent
"Command T settings
let g:CommandTMaxFiles=500000
let g:CommandTFileScanner='watchman'
