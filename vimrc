" @file vimrc
" @author Henrik Holst <holst@matmech.com>

" =============================================================================
" Useful stuff
" 
" set guifont=*                         GUI popup font selector.
" set spell spellang=sv                 Spell checking (Swedish).
" =============================================================================

" =============================================================================
" Global settings
" =============================================================================

syntax enable
filetype plugin indent on
set autoread                            " Automatically reload external changes.
set backspace=indent,eol,start
set clipboard^=unnamed,unnamedplus      " http://bit.ly/1XzQyju
set hlsearch
set incsearch                           " Incremental search.
set laststatus=2
set lazyredraw                          " Speed up redrawing.
set linebreak
set listchars=tab:>\ ,trail:~,extends:>,precedes:<
set noerrorbells                        " Disable annoying audio beeps.
set nolist                              " Formatting characters.
set noswapfile                          " Disable swap files.
set novisualbell                        " Disable visual bell.
set pastetoggle=<INS>
set ruler                               " Show cursor position all the time.
set scrolloff=8
set shortmess=aoOtI                     " http://bit.ly/1Q8NyFE
set showmatch                           " Show matching parenthesis.
set statusline=%F%m%r%h%w
set title                               " Change terminal title.
set ttyfast                             " Speed up Vim session. [Alex Pounds]
set updatetime=500

" =============================================================================
" Load pathogen and insert all bundles.
" =============================================================================

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-youcompleteme')
call add(g:pathogen_disabled, 'vim-neocomplete')

if v:version < '703' || v:version == '703' && !has('patch584') || !has('python')
	call add(g:pathogen_disabled, 'vim-youcompleteme')
	call add(g:pathogen_disabled, 'vim-ctab')
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

" =============================================================================
" Default settings and package configuration.
" =============================================================================

if has("win32")
	set fileformat=dos
endif

" =============================================================================
" GUI settings.
" =============================================================================

if has("gui_running")
	set guioptions=
	autocmd GUIEnter * set vb t_vb=
	let g:solarized_visibility="low"

	if has("win32")
		set guifont=Consolas:h10:cANSI
	else
		set guifont=Inconsolata\ Medium\ 12
	endif
else
	if $TERM == 'cygwin'
	else
		set t_Co=256
	endif

endif

" =============================================================================
" Key mappings.
" =============================================================================

nmap <silent> <Leader><Space> :nohlsearch<CR>
nmap <silent> <Leader>1 :call ToggleColorSchemeLight()<CR>
nmap <silent> <Leader>2 :call ToggleColorSchemeDark()<CR>
nmap <silent> <Leader>3 :call ToggleColorSchemeDefault()<CR>
nmap <silent> <Leader>d :silent !diff -u "#" "%" > E:\diff.patch<CR>
nmap <silent> <Leader>p :1,$d _<CR>P
nmap <silent> Y :.,$y<CR>
nnoremap <Leader>/ /\c
nnoremap <Leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" =============================================================================
" Macros.
" =============================================================================

let @b = "yiwcw<^[]pa></^[]pa>^[bb"

" =============================================================================
" AutoCommand settings.
" =============================================================================

au BufNewFile,BufRead *.build set filetype=xml
au BufNewFile,BufRead *.c set cindent cinoptions=(0,u0,U0

" =============================================================================
" Scripts
" =============================================================================

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.

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

function! SystemRand()
	if has('unix')
		return system("echo $RANDOM")
	elseif has('win16') || has('win32') || has('win64')
		return system("echo %RANDOM%")
	endif
endfunction

function! NativeRand()
	return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

function! ToggleColorSchemeLight()
	let arr=["solarized", "PaperColor", "github",
	\        "eclipse"]
	if !exists("g:colors_name")
		let g:colors_name = "default"
	endif
	while 1
		let rnd=NativeRand()%len(arr)
		let cs=arr[rnd]
		if match(cs, g:colors_name)
			break
		endif
	endwhile
	set background=light
	execute "colorscheme ".cs
	let g:colors_name=cs
endfunction

function! ToggleColorSchemeDark()
	let arr=["lxvc", "wombat256", "xoria256", 
	\        "vanzan_color", "0x7A69_dark", "xterm16"]
	if !exists("g:colors_name")
		let g:colors_name = "default"
	endif
	while 1
		let rnd=NativeRand()%len(arr)
		let cs=arr[rnd]
		if match(cs, g:colors_name)
			break
		endif
	endwhile
	set background=dark
	execute "colorscheme ".cs
	let g:colors_name=cs
endfunction

function! ToggleColorSchemeDefault()
	if has('gui')
		set background=light
	else
		set background=dark
	endif
	colorscheme default
endfunction
