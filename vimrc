"----------------------------------Plugins---------------------------------
call plug#begin('~/.vim/plugged')

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-system-copy'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "you need node to use this
Plug 'pangloss/vim-javascript'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'pechorin/any-jump.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-conflicted'
call plug#end()

"---------------------------General Configs---------------------------------
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
"this only works in neovim
set inccommand=nosplit

"------------------------------Status Line------------------------------------
"status line highlight groups
highlight StatuslineGit ctermbg=darkgray ctermfg=darkgreen guibg=darkgray guifg=green
highlight StatuslineFilePath ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white
highlight StatuslineFileName ctermbg=darkgrey ctermfg=blue guibg=darkgrey guifg=lightblue
highlight StatuslineFileType ctermbg=darkgrey ctermfg=yellow guibg=darkgrey guifg=yellow

"status line elements
function! StatuslineGit()
  let l:branchname = FugitiveHead()
  return strlen(l:branchname) > 0 ? l:branchname : 'No Git Repo'
endfunction

function! StatuslineFileType()
    return ''.&filetype.''
endfunction

function! StatuslineFilePath()
    let l:filetype = expand("%:h")
    return l:filetype == '.' ? 'root' : l:filetype
endfunction

function! StatuslineFileName()
    return expand("%:t")
endfunction

"build status line
set laststatus=2
set statusline=
set statusline+=%#StatuslineGit#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatuslineFilePath#
set statusline+=\ %{StatuslineFilePath()}/
set statusline+=%#StatuslineFileName#
set statusline+=%{StatuslineFileName()}
set statusline+=%#StatuslineFileType#
set statusline+=\ %{StatuslineFileType()}

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
"scroll up
noremap <Leader>sk <C-U>
"scroll down
noremap <Leader>sj <C-D>
set scroll=20


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

"-------------fzf and ripgrep settings------------------
" set rtp+=/usr/local/opt/fzf

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

" use ripgrep for keyword lookup
set kp=:Rg

"--------------coc settings----------------------------
"use tab completion
 inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
 set cmdheight=2
 set updatetime=100

"-----------netrw-settings-----------------------------
" this makes netrw behave pretty much how my nerdtree setup did
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
noremap <silent> <Leader>o :Lexplore<CR>

"-----------fugitive settings--------------------------
"git status
noremap <silent> <Leader>gs :Gstatus<CR>
"git commit
noremap <silent> <Leader>gc :Gcommit<CR>
"git checkout
noremap <Leader>ch :Git checkout 
"git diff
noremap <Leader>df :Gdiff 
"git diff develop
noremap <silent> <Leader>ddf :Gdiff develop<CR>
"git diff master
noremap <silent> <Leader>mdf :Gdiff master<CR>

"-----------vim scratch settings-----------------------
let g:scratch_persistence_file='~/.scratch.vim'

"-----------undotree settings--------------------------
noremap <silent> <Leader>u :UndotreeToggle<CR>

"-----------pandoc settings----------------------------
let g:pandoc#modules#disabled=["spell"]
"-----------any-jump-----------------------------------
let g:any_jump_disable_default_keybindings = 1
noremap <silent> <Leader>J :AnyJump<CR>
noremap <silent> <Leader>ab :AnyJumpBack<CR>

"-----------colorizer----------------------------------
noremap  <Leader>co :ColorToggle<CR>

" ----------vim-wiki------------------------------------
nmap <Leader>qq <Plug>VimwikiIndex
nmap <Leader>qt <Plug>VimwikiTabIndex
nmap <Leader>qs <Plug>VimwikiUISelect
nmap <Leader>dt <Plug>VimwikiMakeDiaryNote
nmap <Leader>di <Plug>VimwikiDiaryIndex
