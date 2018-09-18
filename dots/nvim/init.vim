"Set values/defaults
let mapleader=" "
set tabstop=4
set expandtab
set shiftwidth=4
set foldenable
set autoindent
set list
set nu
set ignorecase
set hidden
set ttimeout
set ttimeoutlen=100
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set display+=lastline
set encoding=utf-8
set shell=/bin/zsh
set autoread
set fileformats+=mac

"Custom keymapping
inoremap jj <ESC>
vnoremap <C-c> "*y
nnoremap <C-v> "*p

"Abbreviations
cabbrev help tab help

"Declaring plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/nvim-completion-manager'
Plug '/usr/local/opt/fzf'
Plug 'rking/ag.vim'
Plug 'iamcco/markdown-preview.vim'
call plug#end()

"Plugin settings

"LanguageClient settings
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']}

nnoremap <leader>lc :LanguageClientStart<CR>
set laststatus=2
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> L :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F6> :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme= 'gruvbox'
let g:rustfmt_autosave = 0
set completefunc=LanguageClient#complete
