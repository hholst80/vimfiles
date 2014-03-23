" @file vimrc
" @author Henrik Holst <holst@matmech.com>
" Global settings

set nocompatible                        " Disable VI compability.
set ruler                               " Show cursor position all the time.
set incsearch                           " Incremental search.
set list                                " Show formatting characters.
set listchars=tab:>-,trail:~,extends:>,precedes:<
set statusline=%F%m%r%h%w
syntax on

" Default settings

if has("win32")
	set fileformat=dos
endif

" GUI settings

if has("gui_running")
	"colorscheme github
	colorscheme solarized
	let g:solarized_visibility="low"
	set background=light
	if has("win32")
		set guifont=Consolas:h10:cANSI 
	else
		set guifont=Inconsolata\ Medium\ 12
	endif
endif

" AutoCommand settings

au BufNewFile,BufRead *.build set filetype=xml

" Load pathogen and insert all bundles.

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Bundle specific options.

" vim-fugitive
set statusline+=%{fugitive#statusline()}
