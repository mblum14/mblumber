s edited, reload it
autocmd! bufwritepost _vimrc source ~/../tools/Vim/_vimrc

colorscheme desert
syntax enable

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

set autoindex
set cindent
set cinwords=if,else,while,do,for,switch,case,Module,def,Class
set diffexpr=MyDiff()
set expandtab
set foldmethod=indent
set formatoptions=tcqr
set guioptions+=b
set guioptions-=t
set ignorecase
set listchars+=extends:>
set mat=2
set nobackup
set nocompatible
set noswapfile
set nowrap
set nowritebackup
set nu
set shiftwidth=2
set showmatch
set sidescroll=5
set smartcase
set smarttab
set syntax=automatic
set tabstop=2

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

:imap <S-Space> <Esc>
:imap <C-space> <C-p>
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
:nnoremap <silent> <C-Right> :tabnext<CR>
:nnoremap <silent> <C-Left> :tabprevious<CR>

noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

function!MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

