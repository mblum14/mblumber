call pathogen#runtime_append_all_bubndles()
call pathogen#helpers()

autocmd! bufwritepost _vimrc source ~/../tools/Vim/_vimrc

" Colors
colorscheme desert
set background=dark
syntax on
set nu
set syntax=automatic

" Indenting
set autoindent
set cindent
set cinwords=if,else,while,do,for,switch,case,module,def,class,elsif

" Scrollbars
set sidescroll=5

" Windows
set splitbelow splitright

" Cursor highlights
set cursorline

" Search
set hlsearch
set ignorecase
set smartcase
set showmatch

" Line Wrapping
set listchars+=extends:> 
set nowrap

" Tab spacing
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" vimfiles
set nobackup
set noswapfile
set nowritebackup

" Mappings
let mapleader = "'"
:imap <C-t> <Esc>:tabnew<CR>
:imap <C-space> <C-n>
:imap jj <Esc>
:imap uu _
:imap hh =>
:imap aa @
:map <S-Enter> 0<Esc>
:map <Enter> o<Esc>
:nmap <C-t> :tabnew<CR>
:nnoremap <silent> <C-Right> :tabnext<CR>
:nnoremap <silent> <C-Left> :tabprevious<CR>
:noremap <leader>f <Esc>:CommandT<CR>
:noremap <leader>b <Esc>:CommandTBuffer<CR>
:noremap <leader>F <Esc>:CommandTFlush<CR>

" Misc
behave mswin
set formatoptions=tcqr

set guioptions+=b
set guioptions-=t
set mat=2
set nocompatible
