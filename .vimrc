" Use vim settings rather than vi settings.
execute pathogen#infect()
filetype plugin indent on
set runtimepath^=~/.vim/bundle/node
au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict

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
set laststatus=2
set mat=2
set nocompatible
set mousehide
set ar
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory

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

set nowrap
set linebreak
set nojoinspaces


" ================ Trailing Whitespace ==============
set list
set listchars=
set listchars+=tab:→\ 
set listchars+=trail:·
set listchars+=extends:»              " show cut off when nowrap
set listchars+=precedes:«
set listchars+=nbsp:⣿

" ================ Folds ============================

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" ================ Window Splitting =================

set splitbelow
set splitright
set fillchars=vert:│                  " Vertical sep between windows (unicode)
set hidden                            " remember undo after quitting
" reveal already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen
set nostartofline                     " don't jump to col1 on switch buffer

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
set wildignore+=node_modules/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.zip

" ================ Colors ===========================
set background=dark
colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set syntax=automatic
highlight clear SignColumn
highlight clear LineNr

" ================ GUI ==============================

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
    if has("gui_gtk2")
        set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
    elseif has("gui_mac")
        set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    elseif has("gui_win32")
        set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
    endif
    if has('gui_macvim')
        set transparency=5      " Make the window slightly transparent
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1"


" ================ Filetypes =======================
"
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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

" Tagbar
  noremap <leader>T <Esc>:TagbarToggle<CR>
  nmap <F8> :TagbarToggle<CR>

" ctrlp
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir='$HOME/.cache/ctrlp'
let g:ctrlp_user_command={'types': {1: ['.git', 'cd %s && git ls-files --cached --others --exclude-standard']}, 'fallback': 'find %s -type f | grep -E -v "undodir|.gem|tmp/"'}
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_root_markers = ['.git', 'svn', '.hg', '.bzr', '_darcs', 'pom.xml', '.bundle', 'node_modules']
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>m :CtrlPFunky<cr>
nnoremap <leader>M :execute 'CtrlPFunky ' .expand('<cword>')<cr>

" scratch
let g:scratch_autohide = $hidden
let g:scratch_insert_autohide = 1

" Ack
"if executable('ack')
  "set grepprg=ack\ --nocolor\ --nogroup\ --ignore-dir=coverage\ --ignore-dir=log
"endif
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:copen<CR>

" ================ Plugins ==========================

" vim-airline {
    "set guifont=PowerlineSymbols
    "let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'solarized'
    let g:airline_powerline_fonts = 1
    "if !exists('g:airline_powerline_fonts')
    "    " Use the default set of separators with a few customizations
    "    let g:airline_left_sep='›'  " Slightly fancier than '>'
    "    let g:airline_right_sep='‹' " Slightly fancier than '<'
    "endif
" }

" javascript-libraries-syntax {
    let g:used_javascript_libs = 'underscore,angularjs,requirejs,jasmine,chai'
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gg :GitGutterToggle<CR>
" }

" neocomplete {
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
    let g:neocomplete#enable_smart_case = 1 " Use smartcase
    let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
" }
" ================ Autoreload vimrc =================
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

