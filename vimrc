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
"default to relative number
set relativenumber
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
"various remappings mostly changing commands using ctrl to leader 
"because I hate reaching for the ctrl key
"remap split window to leader ws
noremap <Leader>ws <C-w>s
"map switch window up to leader wk
noremap <Leader>wk <C-w>k
"map switch window down to leader wj
noremap <Leader>wj <C-w>j
"map move back full screen to leader up
noremap <Leader>up <C-b>
"map move forward one screen to leader dn
noremap <Leader>dn <C-f>
"map redo to leader r
noremap <Leader>r <C-r>
"set nerdtree toggle to leader o
noremap <silent> <Leader>o :NERDTreeToggle<CR>
"get rid of search highlight with leader + space
noremap <Leader><Space> :noh<CR>
"set toggle relative numbers to leader rel
noremap <Leader>rel :set relativenumber!<CR>
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
