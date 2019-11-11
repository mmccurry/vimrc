"----------------------------------Plugins---------------------------------
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "you need node to use this
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep' "you need ripgrep to use this
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'ryanoasis/vim-devicons' "this only works if you use a supported font. I'm using mononoki-mono patched with nerd-font
call plug#end()

"---------------------------General Configs---------------------------------
"turn off vi compatibility
set nocompatible

set secure
set sessionoptions-=options

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
set splitbelow
set splitright

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

"toggle single quote matching for writing text
function! WritingModeToggle()
    if mapcheck("'", "i") == ""
        inoremap ' ''<left>
    else
        iunmap '
    endif
endfunction()

noremap <silent> <Leader>pa :call WritingModeToggle()<CR>

"----------------Tabs-------------------
"new tab
noremap <silent> <Leader>new :tabnew<CR>
"next tab
noremap <silent> <Leader>nt :tabnext<CR>
"previous tab
noremap <silent> <Leader>pt :tabprevious<CR>

"-------Window Split and Navigation--------
"split window horizontally
noremap <Leader>ws <C-w>s
"split window vertically
noremap <Leader>wv <C-w>v
"equalize windows
noremap <Leader>we <C-w>=
" swap windows
noremap <Leader>wr <C-W>R
" move window to separate tab
noremap <Leader>wt <C-W>T
"switch window up
noremap <Leader>k <C-w>k
"switch window down
noremap <Leader>j <C-w>j
"switch window left
noremap <Leader>h <C-w>h
"switch window right
noremap <Leader>l <C-w>l
" move to top window
noremap <Leader>H <C-W><C-T>
" move to bottom window
noremap <Leader>L <C-W><C-B>


"-----------Miscellaneous-----------------
"copy from cursor to end of line
noremap Y y$
"redo
noremap <Leader>r <C-r>

"source vimrc
noremap <silent> <Leader>src :source ~/.vim/vimrc<CR>

"open vimrc in new tab
function! OpenVimrc()
    tabnew
    e ~/.vim/vimrc
endfunction()

noremap <silent> <Leader>vim :call OpenVimrc()<CR>

"get rid of search highlight
noremap <silent> <Leader><Space> :noh<CR>

"toggle relative numbers
noremap <silent> <Leader>num :set relativenumber!<CR>

"start visual-block mode
noremap <Leader>vb <C-v>

"---------Terminal-----------------------------
function! OpenTerminal()
    wincmd b
    belowright split
    term
    startinsert
    resize 20
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>sh :call OpenTerminal()<CR>

"exit terminal mode
tnoremap jk <C-\><C-n>

" -------Scratch-----------------------------------
function! OpenScratchBuffer()
    wincmd t
    aboveleft split
    resize 10
    e ~/.scratch.txt
endfunction()

function! OpenEmptyScratchBuffer()
    wincmd t
    aboveleft split
    resize 10
    e ~/.scratch.txt
    %d
    w
endfunction()

noremap <silent> gs :call OpenScratchBuffer()<CR>
noremap <silent> gS :call OpenEmptyScratchBuffer()<CR>

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
"toggle nerdtree
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
