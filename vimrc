set nocompatible

"execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
syntax on

set tabstop=4
set shiftwidth=4
set noexpandtab
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

if has("gui_running")
	"colorscheme darkblue
	colorscheme delek
	"set guifont=Consolas:h10:b:cANSI 
	set guifont=Consolas:h10:cANSI 
endif

if (has("win32"))
	set fileformat=dos
endif
