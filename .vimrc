" Use vim settings rather than vi settings.
" This must be call first
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================

behave mswin
syntax on
set number
set history=1000
set showcmd
set showmode
set visualbell
set autoread
set hidden
set splitbelow splitright
set cursorline

set formatoptions=tcqr
set guioptions+=b
set guioptions-=t
set mat=2
set nocompatible
set ar

" ================ Search Settings  =================

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent
set cinwords=if,else,while,do,for,switch,case,module,def,class,elsif

filetype plugin on
filetype indent on
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set listchars+=extends:> 
set nowrap
set linebreak

" ================ Folds ============================

set foldmethod=indent
set foldnestmax=3
set nofoldenable
" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Colors == ========================
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=246
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set nu
set syntax=automatic

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1"


" ================ Mappings =========================
let mapleader = ","
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
:noremap <leader>f <Esc>:FufFile<CR>
:noremap <leader>b <Esc>:FufBuffer<CR>
:noremap <leader>t <Esc>:FufTag<CR>
