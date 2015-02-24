" @file vimrc
" @author Henrik Holst <holst@matmech.com>
" Global settings

set nocompatible                        " Disable VI compability.
set ruler                               " Show cursor position all the time.
set incsearch                           " Incremental search.
set list                                " Show formatting characters.
set listchars=tab:>-,trail:~,extends:>,precedes:<
set statusline=%F%m%r%h%w
set backspace=indent,eol,start
set autoread                            " Automatically reload external changes.
set ttyfast                             " Speed up Vim session. [Alex Pounds]
set lazyredraw                          " Speed up redrawing.
set scrolloff=8
set scrolljump=-50
syntax on
filetype plugin on

" Load pathogen and insert all bundles.

let g:pathogen_disabled = []

if v:version < '703' || v:version == '703' && !has('patch584') || !has('python')
	call add(g:pathogen_disabled, 'vim-youcompleteme')
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Default settings and package configuration.

if has("win32")
	set fileformat=dos
endif

" GUI settings

if has("gui_running")
	let g:solarized_visibility="low"
	set background=light
	if has("win32")
		set guifont=Consolas:h11:cANSI
	else
		set guifont=Inconsolata\ Medium\ 12
	endif
endif

" AutoCommand settings

au BufNewFile,BufRead *.build set filetype=xml
au BufNewFile,BufRead *.c set cindent cinoptions=(0,u0,U0

" Macros

let @b = "yiwcw<]pa></]pa>bb"     " XML brackets
