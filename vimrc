"----------------------------------Plugins---------------------------------
call plug#begin('~/.vim/plugged')
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-system-copy'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "you need node to use this
Plug 'pangloss/vim-javascript'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
call plug#end()

"---------------------------General Configs---------------------------------
"add .vim/ to runtime path
set rtp+=~/.vim

"turn off vi compatibility
set nocompatible

set sessionoptions-=options

"don't make swap files
set noswapfile

"lets you change buffers without saving changes
set hidden

"save undo tree after closing vim
set undofile

"use vim's file checking for plugins
filetype plugin on

"always show signcolumn
set signcolumn=yes

"search configs
set wildmenu
set hlsearch
set ignorecase
set smartcase
set incsearch

if has('nvim')
"incrementally shows status of ex commands
    set inccommand=nosplit
"set pyx to prefer python3
    set pyxversion=3
endif

"------------------------------UI Configs-------------------------------------
syntax on
set number
set lazyredraw
set splitbelow
set splitright

"default to relative number
set relativenumber

set showcmd
set cursorline

"color scheme
colorscheme vim-monokai-tasty
let g:vim_jsx_pretty_colorful_config=1

"without this the background around whitespace characters is a different color
"than the terminal background.
highlight SpecialKey ctermbg=235 guibg=Grey15

"make sign column same color as background
highlight clear SignColumn

"show whitespace
set list lcs=space:·,tab:>-

"------------------------------Status Line------------------------------------
"load statusline colorscheme
colorscheme statusline

"status line elements
function! StatuslineGit()
  let l:branchname = FugitiveHead()
  return strlen(l:branchname) > 0 ? l:branchname : 'No Git Repo'
endfunction

function! StatuslineFilePath()
    let l:filepath = expand('%:h')
    return l:filepath == '.' || l:filepath == '' ? '' : l:filepath . '/'
endfunction

function! StatuslineFileName()
    return expand("%:t")
endfunction

function! StatuslineFileType()
    return ''.&filetype.''
endfunction

"build status line
set laststatus=2
set statusline=
set statusline+=%#StatuslineGit#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatuslineFilePath#
set statusline+=\ %{StatuslineFilePath()}
set statusline+=%#StatuslineFileName#
set statusline+=%{StatuslineFileName()}
set statusline+=%#StatuslineFileType#
set statusline+=\ %{StatuslineFileType()}

"------------------------Indentation Settings-------------------------------
set wrap
set textwidth=0
set wrapmargin=0
set expandtab
set foldmethod=manual
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

"toggle mouse
function! MouseToggle()
    if &mouse == ""
        set mouse=a
    else
        set mouse=""
    endif
endfunction()

noremap <silent> <Leader>mo :call MouseToggle()<CR>

"----------------Tabs-------------------
"new tab
noremap <silent> <Leader>new :tabnew<CR>

"-------Window Split and Navigation--------
"split window horizontally
noremap <Leader>ws <C-w>s
"split window vertically
noremap <Leader>wv <C-w>v
"equalize windows
noremap <Leader>we <C-w>=
"swap windows
noremap <Leader>wr <C-W>R
"move window to separate tab
noremap <Leader>wt <C-W>T
"switch window up
noremap <Leader>k <C-w>k
"switch window down
noremap <Leader>j <C-w>j
"switch window left
noremap <Leader>h <C-w>h
"switch window right
noremap <Leader>l <C-w>l
"move to top window
noremap <Leader>H <C-W><C-T>
"move to bottom window
noremap <Leader>L <C-W><C-B>

"-----------Miscellaneous-----------------
"copy from cursor to end of line
noremap Y y$
"redo
noremap <Leader>r <C-r>
"swap 0 and ^
noremap 0 ^
noremap ^ 0

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

"suspend vim
noremap <Leader>z <C-z>

"compile current file with lilypond
noremap <Leader>lp :!lilypond %<CR>

"-------Scratch-----------------------------------
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

"-------------fzf and ripgrep settings------------------
"set rtp+=/usr/local/opt/fzf

function! FZFSearch()
    FZF
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>t :call FZFSearch()<CR>

function! FZFSearchBuffers()
    Buffers
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>b :call FZFSearchBuffers()<CR>

function! RipGrep()
    Rg
    setlocal nonumber
    setlocal norelativenumber
endfunction()

noremap <silent> <Leader>f :call RipGrep()<CR>

"use ripgrep for keyword lookup
set kp=:Rg

"--------------arduino---------------------------------
function! ArduinoCompile()
    let l:sketch = expand('%:h')
    execute "!arduino-cli compile --fqbn arduino:avr:uno " . l:sketch
endfunction()

function! ArduinoUpload()
    let l:sketch = expand('%:h')
    execute "!arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno " . l:sketch
endfunction()

noremap <silent> <Leader>ac :call ArduinoCompile()<CR>
noremap <silent> <Leader>au :call ArduinoUpload()<CR>

"--------------coc settings----------------------------
"use tab completion
 inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
 set cmdheight=2
 set updatetime=100

"-----------dirvish-settings-----------------------------
function! DirvishToggle()
    if &filetype == "dirvish"
        b#
    else
        Dirvish
    endif
endfunction

noremap <silent> <Leader>o :call DirvishToggle()<CR>

"-----------fugitive settings--------------------------
"git status
noremap <silent> <Leader>gs :Gstatus<CR>
"git commit
noremap <silent> <Leader>gc :Gcommit<CR>
"git checkout
noremap <Leader>ch :Git checkout 
"git diff
noremap <Leader>df :Gdiff 

"-----------undotree settings--------------------------
noremap <silent> <Leader>u :UndotreeToggle<CR>
