" Plugins
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'wincent/command-t'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-run-interactive'
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
let g:airline_theme='monokai_tasty'
"various remappings mostly changing commands using ctrl to leader
"because I hate reaching for the ctrl key
"map split window to leader ws
noremap <Leader>ws <C-w>s
"map split window vertically to leader wv
noremap <Leader>wv <C-w>v
"map switch window up to leader wk
noremap <Leader>wk <C-w>k
"map switch window down to leader wj
noremap <Leader>wj <C-w>j
"map switch window left to leader wh
noremap <Leader>wh <C-w>h
"map switch window right to leader wl
noremap <Leader>wl <C-w>l
"map move back full screen to leader up
noremap <Leader>up <C-b>
"map move forward one screen to leader dn
noremap <Leader>dn <C-f>
"map redo to leader r
" source the vimrc with leader src
noremap <Leader>src :source ~/.vim/vimrc<CR>
noremap <Leader>r <C-r>
"set nerdtree toggle to leader o
noremap <silent> <Leader>o :NERDTreeToggle<CR>
"get rid of search highlight with leader + space
noremap <silent> <Leader><Space> :noh<CR>
"set toggle relative numbers to leader rel
noremap <silent> <Leader>rel :set relativenumber!<CR>
" use leader ri to run interactive shell
nnoremap <leader>ri :RunInInteractiveShell<space>
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
