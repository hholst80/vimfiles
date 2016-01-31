" @file vimrc
" @author Henrik Holst <holst@matmech.com>

" Global settings

set nocompatible                        " Disable VI compability.
set noswapfile                          " Disable swap files.
set novisualbell                        " Disable visual bell.
set noerrorbells                        " Disable annoying audio beeps.
set ruler                               " Show cursor position all the time.
set noincsearch                         " No incremental search.
set list                                " Show formatting characters.
set listchars=tab:>\ ,trail:~,extends:>,precedes:<
set statusline=%F%m%r%h%w
set backspace=indent,eol,start
set autoread                            " Automatically reload external changes.
set ttyfast                             " Speed up Vim session. [Alex Pounds]
set title                               " Change terminal title.
set lazyredraw                          " Speed up redrawing.
set scrolloff=8
set hlsearch
set pastetoggle=<INS>
syntax on
filetype plugin indent on

" Load pathogen and insert all bundles.

let g:pathogen_disabled = []

if v:version < '703' || v:version == '703' && !has('patch584') || !has('python')
	call add(g:pathogen_disabled, 'vim-youcompleteme')
	call add(g:pathogen_disabled, 'vim-ctab')
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

" Default settings and package configuration.

if has("win32")
	set fileformat=dos
endif

" GUI settings

if has("gui_running")
	set guioptions=egrLt
	autocmd GUIEnter * set vb t_vb=
	let g:solarized_visibility="low"
	set background=light
	"colorscheme solarized
	"colorscheme xoria256
	"colorscheme seoul256-light
	colorscheme vanzan_color
	if has("win32")
		set guifont=Consolas:h10:cANSI
	else
		set guifont=Inconsolata\ Medium\ 12
	endif
else
	set background=dark
endif

" Key mappings

nmap <silent> ,/ :nohlsearch<CR>

" AutoCommand settings

au BufNewFile,BufRead *.build set filetype=xml
au BufNewFile,BufRead *.c set cindent cinoptions=(0,u0,U0

" Macros

let @b = "yiwcw<]pa></]pa>bb"     " XML brackets

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction
