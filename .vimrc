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
"set wildignore+=vendor/rails/**
"set wildignore+=vendor/cache/**
"set wildignore+=*.gem
"set wildignore+=log/**
"set wildignore+=tmp/**
"set wildignore+=node_modules/**
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

" ================ Plugins ==========================

" Tagbar
  noremap <leader>T <Esc>:TagbarToggle<CR>
  nmap <F8> :TagbarToggle<CR>

" ctrlp
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir='$HOME/.cache/ctrlp'
let g:ctrlp_user_command={'types': {1: ['.git', 'cd %s && git ls-files --cached --others --exclude-standard']}, 'fallback': 'find %s -type f | grep -E -v "undodir|.gem|tmp/"'}
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_root_markers = ['.git', 'svn', '.hg', '.bzr', '_darcs', '.bundle']
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
  let g:ack_working_path_mode="r"
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --vimgrep --nocolor -g ""'
  let g:ctrlp_use_caching = 0

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  nnoremap <space>s/ :Ag<space>
  nnoremap <space>sw :grep! "\b<c-r><c-w>\b"<cr>:cw<cr>
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:copen<CR>

" vim-airline {
    set guifont=PowerlineSymbols
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#coc#enabled = 1
    let g:airline_theme = 'solarized'
    let g:airline_powerline_fonts = 1
    "if !exists('g:airline_powerline_fonts')
    "    " Use the default set of separators with a few customizations
    "    let g:airline_left_sep='›'  " Slightly fancier than '>'
    "    let g:airline_right_sep='‹' " Slightly fancier than '<'
    "endif
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

" tmux-nagivator "
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" coc.vim "
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ================ Autoreload vimrc ================= "
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

