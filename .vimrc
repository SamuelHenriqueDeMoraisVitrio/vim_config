" SET_GLOBALS ------------------------------------------------------------------{{{
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=2        " Show existing tab with 4 spaces width
set softtabstop=2    " Show existing tab with 4 spaces width
set shiftwidth=2     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=18      " Minimum number of lines to keep above and below the cursor
"set cursorline
set linebreak
set showbreak=--+
set hlsearch
" Há certos arquivos que nunca gostaríamos de editar com o Vim.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx "O Wildmenu ignorará arquivos com essas extensões.
set guifont=DroidSansMono\ Nerd\ Font\ 11
"set colorcolumn=200  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any
" }}}



" remap ------------------------------------------------------------------{{{
" Mapeamento para mover a linha atual para cima
nnoremap <silent> <A-Up> :<C-u>move -1-.v:count1<CR>==
inoremap <silent> <A-Up> <Esc>:<C-u>move -1-.v:count1<CR>==gi
"Para que o comando funcione no modo visual
vnoremap <silent> <A-Up> :<C-u>move '<-2-'.v:count1<CR>gv=gv

" Mapeamento para mover a linha atual para baixo
nnoremap <silent> <A-Down> :<C-u>move +.v:count1<CR>==
inoremap <silent> <A-Down> <Esc>:<C-u>move +.v:count1<CR>==gi
"Para que o comando funcione no modo visual
vnoremap <silent> <A-Down> :<C-u>move '>+'.v:count1<CR>gv=gv
"
" Cola a linha para baixo
nnoremap <S-A-Down> :<C-u>t.<CR>
inoremap <S-A-Down> <Esc>:<C-u>t.<CR>
"
" O comando control+d abre ou fecha a lista de arquivos
nmap <C-d> :<C-u>NERDTreeToggle<CR>

" Anda entre os buffers com control+shift+setas
nnoremap <C-S-Right> :<C-u>bn<CR>
nnoremap <C-S-Left> :<C-u>bp<CR>
" Deleta um buffer
nmap td :<C-u>bd<CR>

nmap md :<C-u>!

map q :<C-u>q<CR>

map w :<C-u>w<CR>
" }}}



"AUTO CMD -------------------------------------------------------------------{{{
"function! HighlightWordUnderCursor()
"   if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
"        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
"    else
"        match none
"    endif
"endfunction
"
"autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
"}}}



" PLUG INS ------------------------------------------------------------------{{{

call plug#begin('~/.vim/plugged')

"  Plug 'sainnhe/sonokai'
	Plug 'scrooloose/nerdtree'
	Plug 'bling/vim-airline'
	Plug 'chun-yang/auto-pairs'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'itchyny/vim-cursorword'
  Plug 'dense-analysis/ale'
  Plug 'mattn/emmet-vim'

call plug#end()
" }}}



" AIRLINE ------------------------------------------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"  }}}



" ALE ---------------------------------------------------------------------------------{{{
" Configuração do ALE
let g:ale_linters = {
    \   'vim': ['vint'],
    \   'python': ['flake8'],
    \   'cpp': ['clangd'],
    \   'c': ['clangd'],
    \   'javascript': ['eslint', 'biome'],
    \   'xml': ['xmllint'],
    \   'html': ['tidy'],
    \   'json': ['jsonlint']
\}

let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Ativar ALE para todos os tipos de arquivo
let g:ale_enabled = 1

let g:ale_fixers = {
    \   '*': ['trim_whitespace'],
    \   'vim': ['vim'],
    \   'python': ['black', 'isort', 'autopep8 --in-place'],
    \   'cpp': ['clang-format'],
    \   'c': ['clang-format'],
    \   'javascript': ['eslint', 'biome'],
    \   'xml': ['xmllint --format'],
    \   'html': ['tidy -q -i --show-warnings false'],
    \   'json': ['jq .']
\}

" Ativar ALE automaticamente ao abrir arquivos
augroup ale_autostart
    autocmd!
    autocmd BufEnter * ALEEnable
augroup END
"}}}



" C/C++ """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_c_clangformat_options = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 100,
\ AllowShortBlocksOnASingleLine: Always,
\ AllowShortFunctionsOnASingleLine: Inline,
\ FixNamespaceComments: true,
\ ReflowComments: false,
\ }"'
