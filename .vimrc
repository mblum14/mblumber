function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

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
set shell=/bin/bash
set tags=./tags
set hidden

set splitbelow splitright

set cursorline

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
set undodir=~/.vim/backups
set undofile
set undolevels=1000
set undoreload=10000

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
let colorcolumn="120"
highlight colorcolumn guibg=#2c2d27
set syntax=automatic
highlight clear SignColumn
highlight clear LineNr

" ================ GUI ==============================
set laststatus=2
set mat=2
set nocompatible
set mousehide
set ar
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
:imap Jj <Esc>
:imap uuu _
:imap hhh =>
:imap aaa @
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
    set guifont=PowerlineSymbols
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'solarized'
    let g:airline_powerline_fonts = 1
    "if !exists('g:airline_powerline_fonts')
    "    " Use the default set of separators with a few customizations
    "    let g:airline_left_sep='›'  " Slightly fancier than '>'
    "    let g:airline_right_sep='‹' " Slightly fancier than '<'
    "endif
" }

" ctrlp {
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_cache_dir='$HOME/.cache/ctrlp'
    let g:ctrlp_user_command={'types': {1: ['.git', 'cd %s && git ls-files --cached --others --exclude-standard']}, 'fallback': 'find %s -type f | grep -E -v "undodir|.gem|tmp/"'}
    let g:ctrlp_switch_buffer = 'Et'
    let g:ctrlp_root_markers = ['.git', '.svn', '.hg', '.bzr', '_darscs', 'pom.xml', '.bundle', 'node_modules']
    let g:ctrlp_extensions = ['funky']
    let g:ctrlp_funky_multi_buffers = 1
    let g:ctrlp_funky_matchtype = 'path'
    let g:ctrlp_funky_syntax_highlight = 1

" javascript-libraries-syntax {
    let g:used_javascript_libs = 'underscore,angularjs,requirejs,jasmine,chai'
" }

" vim-json {
    let g:vim_json_syntax_conceal = 0
    let g:vim_json_warnings = 0
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

" Syntastic replaced by ale for vim 8.1+ "
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_json_checkers = ['jsonlint']
"let g:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
"
"highlight link SysntasticErrorSign SignColumn
"highlight link SysntasticWarningSign SignColumn
"highlight link SysntasticStyleErrorStyle SignColumn
"highlight link SysntasticStyleWarningSign SignColumn

" ale "
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled = 1

" tmux-nagivator "
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" typescript "
let g:typescript_compiler_binary = "tsc"
let g:typescript_compiler_options = ""
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^1]* nested cwindow
autocmd QuickFixCmdPost    1* nested lwindow

" ================ Autoreload vimrc ================= "
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

