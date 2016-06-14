" @file vimrc
" @author Henrik Holst <holst@matmech.com>

" =============================================================================
" Useful stuff
" 
" set guifont=*                         GUI popup font selector.
" set spell spellang=sv                 Spell checking (Swedish).
" =============================================================================

" =============================================================================
" TODO
" 
" --remote-tab-wait -d for vimdiff in existing session.
" set cryptmethod=blowfish2 does not seem to work?
" CTRL-S is traped by terminal and not sent to Vim. What does CTRL-S do?
" =============================================================================

" =============================================================================
" Global settings
" NOTE: Load sensible.vim from tpope so no need to re-set those here.
" =============================================================================

set clipboard^=unnamed,unnamedplus      " http://bit.ly/1XzQyju
set gdefault                            " :substitute flag 'g' is default on
set hlsearch                            " I like it again.
set incsearch                           " Incremental search.
set lazyredraw                          " Speed up redrawing.
set noerrorbells                        " Disable annoying audio beeps.
set nolist                              " Formatting characters.
set noswapfile                          " Disable swap files.
set pastetoggle=<INS>
set scrolloff=8                         " Override sensible.vim default (was 1)
set shortmess=aoOtI                     " http://bit.ly/1Q8NyFE
set showmatch                           " Show matching parenthesis.
set title                               " Change terminal title.
set ttyfast                             " Speed up Vim session. [Alex Pounds]
set updatetime=500
set cryptmethod=blowfish2               " Requires Vim 7.4.399 or later.
set nojoinspaces                        " gq should not keep double spaces
set nowrap
set linebreak

if &diff                                " Disable readonly for vimdiff.
	setlocal noro
endif

if has('win32')                         " Swapfiles and backup are not used
	set directory=$HOME/vimfiles/swapfiles
	set backupdir=$HOME/vimfiles/backups
else
	set directory=$HOME/.vim/swapfiles
	set backupdir=$HOME/.vim/backups
endif

let g:html_dynamic_folds=1              " Save entire diff (folded) in html.

" =============================================================================
" Load pathogen and insert all bundles.
" =============================================================================

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-youcompleteme')
call add(g:pathogen_disabled, 'vim-neocomplete')
call add(g:pathogen_disabled, 'vim-bookmarks')
call add(g:pathogen_disabled, 'vim-colorscheme-switcher')

if v:version < '703' || v:version == '703' && !has('patch584') || !has('python')
	call add(g:pathogen_disabled, 'vim-youcompleteme')
	call add(g:pathogen_disabled, 'vim-ctab')
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

" =============================================================================
" GUI settings.
" =============================================================================

if has("gui_running")
	set guioptions=
	autocmd GUIEnter * set vb t_vb=
	let g:solarized_visibility="low"
else
	if $TERM == 'cygwin'
	else
		set t_Co=256
	endif
endif

if has("gui_running") && &guifont == ""
	colorscheme github
	if has("win32")
		set guifont=Consolas:h10:cANSI
	else
		set guifont=Ubuntu\ Mono\ 12
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
nmap <silent> <Leader>ve :tabnew $MYVIMRC<CR>
nmap <silent> <Leader>vs :source $MYVIMRC<CR>
nmap <Leader>s :GitGutterStageHunk<CR>
nmap Y :.,$y<CR>
nmap %y :%y<CR>
nmap %Y :%y<CR>
nnoremap <Leader>/ /\c
"nnoremap <Leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
nnoremap <silent> <Leader>z :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'<CR>
"nmap <c-f> :call QuietSearch(inputdialog("what? "))<cr>:copen<cr>:set nowrap<cr><c-w>K
nmap <C-f> :Unite grep:.<CR>
nmap <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>
vmap <C-s> <Esc>:w<CR>gv
nmap <C-n> :tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile<CR>
nmap <M-n> :enew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile<CR>
imap <C-n> <C-o>:tabnew<CR><C-o>:setlocal buftype=nofile bufhidden=hide noswapfile<CR>

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

nmap <silent> <M-1> :tabnext 1<CR>
nmap <silent> <M-2> :tabnext 2<CR>
nmap <silent> <M-3> :tabnext 3<CR>
nmap <silent> <M-4> :tabnext 4<CR>
nmap <silent> <M-5> :tabnext 5<CR>
nmap <silent> <M-6> :tabnext 6<CR>
nmap <silent> <M-7> :tabnext 7<CR>
nmap <silent> <M-8> :tabnext 8<CR>
nmap <silent> <M-9> :tabnext 9<CR>

nmap f viw<Esc>`<

" =============================================================================
" Macros.
" =============================================================================

let @b = "yiwcw<pa></pa>bb"
let @u = "yyp:s/./=/\r"

" =============================================================================
" https://github.com/monochromegane/the_platinum_searcher
" =============================================================================

nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" =============================================================================
" Scripts.
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
	\        "vanzan_color", "0x7A69_dark", "xterm16",
	\        "mustang" ]
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

function! QuietSearch(expr)
	cexpr []
	execute "silent! bufdo vimgrepadd /".a:expr."/ %"
endfunction

" =============================================================================
" Auto command settings.
" =============================================================================

augroup filetype_build
	au!
	au BufNewFile,BufRead *.build setlocal filetype=xml
augroup END

augroup filetype_c
	au!
	au BufNewFile,BufRead *.c setlocal cindent cinoptions=(0,u0,U0
augroup END

function! PreviewGitHunk()
	if &previewwindow
		return
	endif
	try
		silent! call gitgutter#preview_hunk()
	catch
		return
	endtry
	let ft=&ft
	silent! wincmd P                " jump to preview window
	if &previewwindow               " if we really get there...
		if has("folding")
			silent! .foldopen! " don't want a closed fold
		endif
		exec 'setlocal filetype=' . ft
	endif
	wincmd p                        " Back to old window
endfunction

" augroup filetype_previewwindow
" 	au!
" 	au CursorHold * nested call PreviewGitHunk()
" augroup END

" http://vim.wikia.com/wiki/How_to_make_fileencoding_work_in_the_modeline

function! CheckFileEncoding()
  if exists('b:fenc_at_read') && &fileencoding != b:fenc_at_read
    exec 'e! ++enc=' . &fileencoding
    unlet b:fenc_at_read
  endif
endfunction

augroup aug_fileencoding
	au BufRead     * let b:fenc_at_read=&fileencoding
	au BufWinEnter * call CheckFileEncoding()
augroup END
