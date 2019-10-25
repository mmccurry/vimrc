"----------------------------------Plugins---------------------------------
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "you need node for this to work
Plug 'junegunn/fzf' "you need to already have fzf installed for this to work
Plug 'jremmen/vim-ripgrep' "you need to already have ripgrep installed for this to work
Plug 'mtth/scratch.vim'
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'ryanoasis/vim-devicons' "only works if you use a nerd-font compatible font. I'm using mononoki-mono
call plug#end()

"---------------------------General Configs---------------------------------
"turn off vi compatibility
set nocompatible

"don't make swap files
set noswapfile

"lets you change buffers without saving changes
set hidden

" save undo tree after closing vim
set undofile

"use vim's file checking for plugins
filetype plugin on

"always show signcolumn
set signcolumn=yes

"search configs
set path+=**
set wildmenu
set hlsearch
set ignorecase
set smartcase
set incsearch
set inccommand=nosplit

"------------------------------UI Configs-------------------------------------
syntax on
set number
set lazyredraw

"default to relative number
set relativenumber

set showcmd
set ruler
set cursorline

"color scheme
colorscheme vim-monokai-tasty

"sets the color for whitespace characters to grey
highlight SpecialKey ctermbg=235

"make sign column same color as background
highlight clear SignColumn

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
"use Y to copy from cursor to end of line
noremap Y y$
"map redo to leader r
noremap <Leader>r <C-r>

"source the vimrc with leader src
noremap <silent> <Leader>src :source ~/.vim/vimrc<CR>

" open vimrc with leader vim
noremap <silent> <Leader>vim :e ~/.vim/vimrc<CR>

"get rid of search highlight with leader + space
noremap <silent> <Leader><Space> :noh<CR>

"set toggle relative numbers to leader num
noremap <silent> <Leader>num :set relativenumber!<CR>

" start visual-block mode
noremap <Leader>vb <C-v>

"---------Terminal-----------------------------
function! OpenTerminal()
    term
    startinsert
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>sh :call OpenTerminal()<CR>

"exit terminal mode with jk
tnoremap jk <C-\><C-n>
"-----------------------Plugin Settings----------------------------------------

"---------------vim-json settings-----------------------
"stop vim-json from hiding quotes in json files
let g:vim_json_syntax_conceal=0

"-------------fzf settings------------------------------
" set rtp+=/usr/local/opt/fzf

function! FZFSearch()
    FZF
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>t :call FZFSearch()<CR>

"--------------FZF settings----------------------------
function! RipGrep()
    Rg
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>gr :call RipGrep()<CR>

"--------------coc settings----------------------------
"use tab completion
 inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
 set cmdheight=2
 set updatetime=300

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
noremap <silent> <Leader>gdvm :Gdiff development<CR>
noremap <silent> <Leader>gdev :Gdiff develop<CR>
"-----------vim scratch settings-----------------------
let g:scratch_persistence_file='~/.scratch.vim'
"-----------undotree settings--------------------------
noremap <silent> <Leader>u :UndotreeToggle<CR>
