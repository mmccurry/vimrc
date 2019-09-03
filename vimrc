"----------------------------------Plugins---------------------------------
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'elzr/vim-json'
" Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
call plug#end()

"---------------------------General Configs---------------------------------
"turn off vi compatibility
set nocompatible

"don't make swap files
set noswapfile

"lets you change buffers without saving changes
set hidden

"use vim's file checking for plugins
filetype plugin on

"search configs
set path+=**
set wildmenu
set hlsearch
set ignorecase
set smartcase
set incsearch

"turn on omnicompletion
set omnifunc=syntaxcomplete#Complete

"------------------------------UI Configs-------------------------------------
syntax on
set number
set lazyredraw

"default to relative number
set relativenumber

set showcmd
set ruler
set cursorline

"colors
colorscheme vim-monokai-tasty
highlight SpecialKey ctermbg=235

"show whitespace
set list lcs=space:·,tab:>-

"------------------------Indentation Settings-------------------------------
set wrap
set textwidth=0
set wrapmargin=0
set expandtab
set foldmethod=indent
set foldlevel=99

"------------------------Bracket Matching----------------------------------
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>

"-----------------------Remappings ----------------------------------------
"change leader to ,
let mapleader=','

"----------------Tabs-------------------
"map new tab to ,new
noremap <silent> <Leader>new :tabnew<CR>
"map next tab to ,nt
noremap <silent> <Leader>nt :tabnext<CR>
"map previous tab to ,pt
noremap <silent> <Leader>pt :tabprevious<CR>

"-------Window Split and Navigation--------
"map split window to leader ws
noremap <Leader>ws <C-w>s
"map split window vertically to leader wv
noremap <Leader>wv <C-w>v
"map switch window up to leader k
noremap <Leader>k <C-w>k
"map switch window down to leader j
noremap <Leader>j <C-w>j
"map switch window left to leader h
noremap <Leader>h <C-w>h
"map switch window right to leader l
noremap <Leader>l <C-w>l

"-----------Miscellaneous-----------------
"map redo to leader r
noremap <Leader>r <C-r>

"source the vimrc with leader src
noremap <silent> <Leader>src :source ~/.vim/vimrc<CR>

"get rid of search highlight with leader + space
noremap <silent> <Leader><Space> :noh<CR>

"set toggle relative numbers to leader num
noremap <silent> <Leader>num :set relativenumber!<CR>

"exit terminal with escape
tnoremap <ESC> <C-\><C-n>

"-----------------------Plugin Settings----------------------------------------

"---------------vim-json settings-----------------------
"stop vim-json from hiding quotes in json files
let g:vim_json_syntax_conceal=0

"------------- command t settings-----------------------
let g:CommandTMaxFiles=500000
let g:CommandTFileScanner='watchman'

"--------------deoplete settings-----------------------
"use tab completion
 inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"------------nerdtree settings-------------------------
"set nerdtree toggle to leader o
noremap <silent> <Leader>o :NERDTreeToggle<CR>

"-----------airline settings---------------------------
let g:airline_theme='monokai_tasty'

"-----------fugitive settings--------------------------
"git status
noremap <silent> <Leader>gs :Gstatus<CR>
"git commit
noremap <silent> <Leader>gc :Gcommit<CR>
"git checkout
noremap <Leader>ch :Git checkout 
"checkout development
noremap <silent> <Leader>dev :Git checkout development<CR>
"checkout branch starting with mmccurry-LST-
noremap <Leader>gmm :Git checkout mmccurry-LST-
"git diff
noremap <Leader>df :Gdiff 
"git diff development
noremap <silent> <Leader>dvdf :Gdiff development<CR>
